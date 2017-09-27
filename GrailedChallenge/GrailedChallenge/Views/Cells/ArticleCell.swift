//
//  ArticleCell.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/27/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
	
	@IBOutlet weak var articleImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var publishedAtLabel: UILabel!
	
	func configure(with viewModel: ArticleCellViewModel) {
		titleLabel.text = viewModel.title
		publishedAtLabel.text = returnFormattedDateString(viewModel: viewModel)
		self.articleImageView.loadImageUsingCacheViaCDN(withURL: viewModel.imageURLString, andWidth: 375, andHeight: 248)
		
		
	}

	private func returnFormattedDateString(viewModel: ArticleCellViewModel) -> String {
		let publishedAt = viewModel.publishedAt
		let indexEnd = publishedAt.index(publishedAt.endIndex, offsetBy: -15)
		let publishedSubstring = publishedAt[...indexEnd]
		let stringFromSubstring = String(publishedSubstring)
		return stringFromSubstring
	}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
