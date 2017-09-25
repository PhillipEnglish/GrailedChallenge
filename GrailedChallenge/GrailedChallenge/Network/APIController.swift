//
//  APIController.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import Alamofire

typealias FeedCompletionHandler = (Result<Data>) -> Void

struct APIController {
	func getArticles(pagination: String?, completionHandler: @escaping FeedCompletionHandler) {
		let _ = Alamofire.request(APIRouter.getArticles(pagination)).responseData { response in
			guard response.result.error == nil else {
				if let error = response.result.error {
					completionHandler(Result.failure(error))
				}
				return
			}
			
			if let data = response.data {
			completionHandler(Result.success(data))
			}
		}
		
		
	}
	
	
}
