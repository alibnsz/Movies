//
//  APIConfigManager.swift
//  Movies
//
//  Created by Mehmet Ali Bunsuz on 28.08.2025.
//

import Foundation

class APIConfigManager {
    static let shared = APIConfigManager()
    
    private var configDict: [String: Any]?
    
    private init() {
        loadConfig()
    }
    
    private func loadConfig() {
        guard let path = Bundle.main.path(forResource: "APIConfig", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            fatalError("❌ APIConfig.plist dosyası bulunamadı!")
        }
        configDict = dict
    }
    
    var tmdbAPIKey: String {
        guard let key = configDict?["TMDB_API_KEY"] as? String else {
            fatalError("❌ TMDB API key bulunamadı!")
        }
        return key
    }
    
    var youtubeAPIKey: String {
        guard let key = configDict?["YOUTUBE_API_KEY"] as? String else {
            fatalError("❌ YouTube API key bulunamadı!")
        }
        return key
    }
}
