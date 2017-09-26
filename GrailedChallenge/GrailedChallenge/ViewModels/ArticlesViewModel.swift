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
	
	private var articles: [Article] = []
	private var paginationString: String? = nil
	
	func getArticlesFromServer(pagination: String?) {
		APIController.getArticles(pagination: pagination) { result in
			switch result {
			case .success(let response):
				self.parseResponseData(responseJSON: response)
			case .failure(let error):
				print(error)
				//handle error here
			}
		}
		
	}
	
	func parseResponseData(responseJSON: JSON) {
		let decoder = JSONDecoder()
		//var dataArray: Data?
		do {
			
			let data = try responseJSON["data"].rawData()
			articles = try decoder.decode([Article].self, from: data)
			print("articles count: \(articles.count)")
		} catch {
			print("could not make article objects from data")
			}
		
		}
}
