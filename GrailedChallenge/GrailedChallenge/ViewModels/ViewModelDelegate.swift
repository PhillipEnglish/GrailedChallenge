//
//  ViewModelDelegate.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/26/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

protocol ViewModelDelegate: class {
	func viewModelDidSetData()
	func viewModelDidThrowError(error: GrailedError)
}
