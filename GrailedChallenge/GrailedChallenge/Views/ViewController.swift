//
//  ViewController.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/19/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var testImage: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		testImage.loadImageUsingCacheViaCDN(withURL: "https://d1qz9pzgo5wm5k.cloudfront.net/api/file/dnOnXLz3QJMU64UlYWQg", andWidth: 236)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

