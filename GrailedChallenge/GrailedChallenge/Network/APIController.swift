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
	
	func getArticles(pagination: String?, compleionHandler: @escaping FeedCompletionHandler) {
		let page: String = pagination ?? ""
		let endpoint = Constants.baseURLString + Constants.articlesPathString + page
		guard let url = URL(string: endpoint) else { return }
		
		let urlRequest = URLRequest(url: url)
		let session = URLSession.shared
		
		let task = session.dataTask(with: urlRequest) { data, response, error in
			
			guard let responseData = data else {
				compleionHandler(Result.failure(GrailedError.invalidDataResponse))
				return
			}
			
			let responseCode = response?.getStatusCode()
			guard responseCode == 200 else {
				compleionHandler(Result.failure(GrailedError.invalidResponseCode(responseCode)))
			}
			
			let responseJSON = JSON(responseData)
			
			compleionHandler(Result.success(responseJSON))
		}
		task.resume()
	}
	
}
