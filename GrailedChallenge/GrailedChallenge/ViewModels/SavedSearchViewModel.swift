//
//  SavedSearchViewModel.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/27/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import SwiftyJSON

class SavedSearchesViewModel {
	
	weak var delegate: ViewModelDelegate?
	private var searches: [SavedSearch] = [] {
		didSet {
			DispatchQueue.main.async {
				self.delegate?.viewModelDidSetData()
			}
		}
	}
	
	
	func getSavedSearchesFromServer() {
		APIController.getSavedSearch() { result in
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
			searches = try decoder.decode([SavedSearch].self, from: data)
		} catch {
			//handle error
			print("could not make article objects from data")
		}
	}
	
	
	func numberOfSearches() -> Int {
		return searches.count
	}
	
	func search(at index: IndexPath) -> SearchCellViewModel {
		let search = searches[index.row]
		return SearchCellViewModel.viewModel(with: search)
	}
	
}
