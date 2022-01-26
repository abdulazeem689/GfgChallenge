//
//  FeedModel.swift
//  GfgChallenge
//
//  Created by Flexnest on 25/01/22.
//

import Foundation

struct FeedModel: Codable {
    let items: [FeedItem]?
}

struct FeedItem: Codable {
    let title: String?
    let thumbnail: String?
    let enclosure: Enclosure?
    let pubDate: String?
}

struct Enclosure: Codable {
    let link: String?
}
