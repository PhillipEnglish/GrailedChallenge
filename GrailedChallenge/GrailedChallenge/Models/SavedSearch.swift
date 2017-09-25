//
//  SavedSearch.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation

struct SavedSearch: Decodable {
	let name: String
	let imageURLString: String 
	
	//codable will automatically look for keys with our property names from a compiler generation CodingKeys enum, which may be different from the actual key in JSON (as in the difference between a camelCase swift property name and a snake_case JSON key) so we add a custom implementation to ensure that we connect property to value as desired
	enum CodingKeys: String, CodingKey {
		case name
		case imageURLString = "image_url"
	}
}
