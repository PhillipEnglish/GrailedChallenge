//
//  APIController.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias FeedCompletionHandler = (Result<JSON>) -> Void

struct APIController {
	
	//Would be nice to make these two very similar functions one more generic function that works like a network response factory for the respective searches.
	static func getSavedSearch(completionHandler: @escaping FeedCompletionHandler) {
		let endpoint = Constants.baseURLString + Constants.savedSearchPathString
		guard let url = URL(string: endpoint) else { return }
		
		let urlRequest = URLRequest(url: url)
		let session = URLSession.shared
		
		let task = session.dataTask(with: urlRequest) { data, response, error in
			
			guard let responseData = data else {
				completionHandler(Result.failure(GrailedError.invalidDataResponse))
				return
			}
			
			let statusCode = response?.getStatusCode() ?? 0
			guard 200...299 ~= statusCode else {
				completionHandler(Result.failure(GrailedError.invalidResponseCode(statusCode)))
				return
			}
			
			let responseJSON = JSON(responseData)
			
			completionHandler(Result.success(responseJSON))
		}
		task.resume()
	}
	
	
	static func getArticles(pagination: String?, completionHandler: @escaping FeedCompletionHandler) {
		let page: String = pagination ?? ""
		let endpoint = Constants.baseURLString + Constants.articlesPathString + page
		guard let url = URL(string: endpoint) else { return }
		
		let urlRequest = URLRequest(url: url)
		let session = URLSession.shared
		
		let task = session.dataTask(with: urlRequest) { data, response, error in
			
			guard let responseData = data else {
				completionHandler(Result.failure(GrailedError.invalidDataResponse))
				return
			}
			
			let statusCode = response?.getStatusCode() ?? 0
			guard 200...299 ~= statusCode else {
				completionHandler(Result.failure(GrailedError.invalidResponseCode(statusCode)))
				return
			}
			
			let responseJSON = JSON(responseData)
			
			completionHandler(Result.success(responseJSON))
		}
		task.resume()
	}
	
}
