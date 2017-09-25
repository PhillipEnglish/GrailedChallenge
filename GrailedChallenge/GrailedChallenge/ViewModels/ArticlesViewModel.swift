//
//  ArticlesViewModel.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation

class ArticlesViewModel {
	
	private var articles: [Article] = []
	private let apiController = APIController()
	private var paginationString: String? = nil
	
	func getArticlesFromServer(pagination: String = paginationString) {
		apiController.getArticles(pagination: pagination) { result in
			switch result {
			case .success(let response):
				self.parseResponseData(response)
			case .failure(let error):
				//handle error here
			}
		}
		
	}
	
	func parseResponseData(responseData: Data) {
		
	}
}
