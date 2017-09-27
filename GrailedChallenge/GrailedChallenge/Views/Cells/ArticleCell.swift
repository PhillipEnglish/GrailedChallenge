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
		publishedAtLabel.text = viewModel.publishedAt
		//DispatchQueue.main.async {
			self.articleImageView.loadImageUsingCacheViaCDN(withURL: viewModel.imageURLString, andWidth: 240)
		//}
		
	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
