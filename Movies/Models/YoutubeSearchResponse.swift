//
//  YoutubeSearchResponse.swift
//  Movies
//
//  Created by Mehmet Ali Bunsuz on 28.08.2025.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoItem
    let snippet: Snippet
}

struct IdVideoItem: Codable {
    let kind: String
    let videoId: String
}

struct Snippet: Codable {
    let title: String
    let channelTitle: String
    let description: String
    let thumbnails: Thumbnails
}

struct Thumbnails: Codable {
    let medium: Thumbnail
}

struct Thumbnail: Codable {
    let url: String
}
