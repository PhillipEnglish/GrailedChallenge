//
//  ArticlesViewController.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/26/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
	
	@IBOutlet weak var articlesTableView: UITableView!
	
	// MARK: - Properties
	lazy var articlesViewModel: ArticlesViewModel = {
		let viewModel: ArticlesViewModel = ArticlesViewModel()
		viewModel.delegate = self
		return viewModel
	}()
	
	var numberOfArticles: Int {
		return articlesViewModel.numberOfArticles()
	}
	let progressHUD = ProgressHUD(text: "Loading")

    override func viewDidLoad() {
        super.viewDidLoad()
		articlesTableView.dataSource = self
		articlesTableView.delegate = self 
		articlesViewModel.getArticlesFromServer(pagination: nil)
		self.view.addSubview(progressHUD)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
	//Mark: Tableview datasource
	extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
		func numberOfSections(in tableView: UITableView) -> Int {
			return 1
		}
		
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return numberOfArticles
		}
		
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			
			let cellViewModel = articlesViewModel.article(at: indexPath)
			let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath)
			
			if let articleCell = cell as? ArticleCell {
				articleCell.configure(with: cellViewModel)
				//articleCell.articleImageView.loadImageUsingCacheViaCDN(withURL: cellViewModel.imageURLString, andWidth: 240)
				//self.articlesTableView.reloadData()
			}
			
			return cell
		}
		
		//Scrolling with Pagination
		open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
			
			if indexPath.row == numberOfArticles - 5 {
				
				guard let paginationString = articlesViewModel.paginationString else { return }
				articlesViewModel.getArticlesFromServer(pagination: paginationString)
				
			}
		}
}

extension ArticlesViewController: ViewModelDelegate {
	func viewModelDidSetData() {
		self.progressHUD.removeFromSuperview()
		self.articlesTableView.reloadData()
		
	}
	
	func viewModelDidThrowError(error: Error) {
		let alert = UIAlertController(title: "Error", message: "There was an error: \(error)", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
			alert.dismiss(animated: true, completion: nil)}))
		self.present(alert, animated: true )
	}
}

