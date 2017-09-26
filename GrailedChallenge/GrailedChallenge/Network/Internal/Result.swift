//
//  Result.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation

public enum Result<T> {
	case success(T)
	case failure(Error)
	
	var error: Error? {
		switch self {
		case .success(_): return nil
		case .failure(let error): return error
		}
	}
	
	
}

enum GrailedError: Error {
	case invalidDataResponse
	case invalidResponseCode(int)
}
