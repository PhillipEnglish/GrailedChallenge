//
//  SavedSearchViewController.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/26/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import UIKit

class SavedSearchViewController: UIViewController {
	
	@IBOutlet weak var searchesTableView: UITableView!
	
	// MARK: - Properties
	lazy var searchesViewModel: SavedSearchesViewModel = {
		let viewModel: SavedSearchesViewModel = SavedSearchesViewModel()
		viewModel.delegate = self
		return viewModel
	}()
	
	var numberOfSearches: Int {
		return searchesViewModel.numberOfSearches()
	}
	let progressHUD = ProgressHUD(text: "Loading")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		searchesTableView.dataSource = self
		searchesTableView.delegate = self
		searchesViewModel.getSavedSearchesFromServer()
		self.view.addSubview(progressHUD)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
//Mark: Tableview datasource
extension SavedSearchViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return numberOfSearches
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cellViewModel = searchesViewModel.search(at: indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath)
		
		if let searchCell = cell as? SearchCell {
			searchCell.configure(with: cellViewModel)
		}
		
		return cell
	}
	
}

extension SavedSearchViewController: ViewModelDelegate {
	func viewModelDidSetData() {
		self.progressHUD.removeFromSuperview()
		self.searchesTableView.reloadData()
		
	}
	
	func viewModelDidThrowError(error: Error) {
		let alert = UIAlertController(title: "Error", message: "There was an error: \(error)", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
			alert.dismiss(animated: true, completion: nil)}))
		self.present(alert, animated: true )
	}
}
