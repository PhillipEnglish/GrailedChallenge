//
//  Article.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/24/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//

import Foundation

struct Article: Decodable {
	
	let title: String
	let imageURLString: String
	let publishedAt: String
	
	//codable will automatically look for keys with our property names from a compiler generation CodingKeys enum, which may be different from the actual key in JSON (as in the difference between a camelCase swift property name and a snake_case JSON key) so we add a custom implementation to ensure that we connect property to value as desired
	enum CodingKeys: String, CodingKey {
		case title
		case imageURLString = "hero"
		case publishedAt = "published_at"
	}
}
