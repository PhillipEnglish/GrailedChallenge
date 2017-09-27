//
//  Extensions.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/19/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
	func loadImageUsingCacheViaCDN(withURL urlString: String, andWidth width:Int, andHeight height: Int) {
		let concatenatedURLString = Constants.baseCDNString + String(width) + Constants.cdnHeightString + String(height) + Constants.secondaryCDNString + urlString
		guard let imageURL = URL(string: concatenatedURLString) else  {return}
		self.image = nil
		// check cache for image
		if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
			self.image = cachedImage
			return
		}
		
		//if no image in cache, download from url
		URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
			if error != nil {
				print(error!)
				return
			}
			
			DispatchQueue.main.async {
				guard let imageData = data else {return}
				if let image = UIImage(data: imageData) {
					imageCache.setObject(image, forKey: urlString as NSString)
					self.image = image
				}
			}
			
		}).resume()
		
	}
	
}

extension URLResponse {
	
	func getStatusCode() -> Int? {
		if let httpResponse = self as? HTTPURLResponse {
			return httpResponse.statusCode
		}
		return nil
	}
}
