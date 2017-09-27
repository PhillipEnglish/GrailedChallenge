//
//  ArticleCellViewModel.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/27/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import UIKit

struct ArticleCellViewModel {
	let cellIdentifier: String = "articleCell"
	let title: String
	let imageURLString: String
	let publishedAt: String
	
	private init(with article: Article) {
		self.title = article.title
		self.imageURLString = article.imageURLString
		self.publishedAt = article.publishedAt
	}
	
	static func viewModel(with article: Article) -> ArticleCellViewModel {
		return ArticleCellViewModel(with: article)
	}
}
