//
//  Constants.swift
//  GrailedChallenge
//
//  Created by Phillip English on 9/19/17.
//  Copyright © 2017 vitkiarts. All rights reserved.
//


internal struct Constants {
	static let baseURLString = "https://www.grailed.com/api/"
	static let baseCDNString = "https://cdn.fs.grailed.com/AJdAgnqCST4iPtnUxiGtTz/rotate=deg:exif/rotate=deg:0/resize=width:"
	static let cdnHeightString = ",height:"
	static let secondaryCDNString = ",fit:crop/output=format:jpg,compress:true,quality:95/"
	static let articlesPathString = "articles/ios_index"
	static let savedSearchPathString = "merchandise/marquee"
	
}

internal struct ArticlesAPIConstants {
	static let dataString = "data"
	static let metaDataString = "metadata"
	static let paginationString = "pagination"
	static let nextPageString = "next_page"
}
