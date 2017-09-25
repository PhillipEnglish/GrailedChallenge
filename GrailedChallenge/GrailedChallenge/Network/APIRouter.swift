//
//  APIRouter.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
	
	case getArticles
	case getSavedSearch
	
	var method: Alamofire.HTTPMethod {
		switch self {
		case .getArticles, .getSavedSearch:
			return .get
		}
	}
	
	var path: String {
		switch self {
		case .getArticles:
			return Constants.articlesPathString
		case .getSavedSearch:
			return Constants.savedSearchPathString
		}
	}
	
	//The router here is mostly useful for when the app begins to grow/scale. We currently have no need for params, but it's good to keep the option here in case we want to add more complex endpoints
	var params: [String: Any]? {
		switch self {
		default:
			return nil
		}
	}
	
	func asURLRequest() throws -> URLRequest {
		let url = URL(string: Constants.baseURLString + path)
		
		//Would be nicer to have a way to not force-unwrap here, but given that we know the url will always return a value, and I'd have to modify sourcecode on a cocoapod, this works.
		var getArticles = URLRequest(url: url!)
		getArticles.httpMethod = method.rawValue
		
		var getSavedSearch = URLRequest(url: url!)
		getSavedSearch.httpMethod = method.rawValue
		
		switch self {
		case .getArticles:
			return try
				Alamofire.URLEncoding.default.encode(getArticles, with: params)
		case .getSavedSearch:
			return try
				Alamofire.URLEncoding.default.encode(getSavedSearch, with: params)
		}
	}
}
