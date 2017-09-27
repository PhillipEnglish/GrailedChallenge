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
	
	let progressHUD = ProgressHUD(text: "Loading")

    override func viewDidLoad() {
        super.viewDidLoad()
		articlesViewModel.getArticlesFromServer(pagination: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
		func numberOfSections(in tableView: UITableView) -> Int {
			return 1
		}
		
		func tableView(
	}
}
