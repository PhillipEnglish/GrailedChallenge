//
//  ArticlesViewModel.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import SwiftyJSON


class ArticlesViewModel {
	
	weak var delegate: ViewModelDelegate?
	private var articles: [Article] = [] {
		didSet {
			DispatchQueue.main.async {
				self.delegate?.viewModelDidSetData()
			}
			
		}
	}
	
	var paginationString: String? = nil
	
	func getArticlesFromServer(pagination: String?) {
		APIController.getArticles(pagination: pagination) { result in
			switch result {
			case .success(let response):
				self.parseResponseData(responseJSON: response)
			case .failure(let error):
				self.delegate?.viewModelDidThrowError(error: error)
			}
		}
		
	}
	
	func parseResponseData(responseJSON: JSON) {
		let decoder = JSONDecoder()
		//var dataArray: Data?
		do {
			let data = try responseJSON["data"].rawData()
			let articlesToAppend = try decoder.decode([Article].self, from: data)
			articles.append(contentsOf: articlesToAppend)
			print("articles count: \(articles.count)")
		} catch {
			print("could not make article objects from data")
			}
		
		if let nextPage = responseJSON[ArticlesAPIConstants.metaDataString][ArticlesAPIConstants.paginationString][ArticlesAPIConstants.nextPageString].string {
			
			let subStringIndex = nextPage.index(nextPage.startIndex, offsetBy: 23)
			let subString = nextPage[subStringIndex...]
			paginationString = String(subString)
			
			
		}
	}
	
	func numberOfArticles() -> Int {
		return articles.count
	}
	
	func article(at index: IndexPath) -> ArticleCellViewModel {
		let article = articles[index.row]
		return ArticleCellViewModel.viewModel(with: article)
	}
}


