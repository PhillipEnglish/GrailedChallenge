//
//  SearchCellViewModel.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/27/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import UIKit

struct SearchCellViewModel {
	let cellIdentifier: String = "searchCell"
	let name: String
	let imageURLString: String
	
	private init(with search: SavedSearch) {
		self.name = search.name
		
		self.imageURLString = search.imageURLString
	}
	
	static func viewModel(with search: SavedSearch) -> SearchCellViewModel {
		return SearchCellViewModel(with: search)
	}
}
