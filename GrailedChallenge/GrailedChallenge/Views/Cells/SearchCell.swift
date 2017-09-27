//
//  SearchCell.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/27/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

	@IBOutlet weak var searchImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!

	func configure(with viewModel: SearchCellViewModel) {
	nameLabel.text = viewModel.name
	searchImageView.loadImageUsingCacheViaCDN(withURL: viewModel.imageURLString, andWidth: 375, andHeight: 248)
		
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
}
