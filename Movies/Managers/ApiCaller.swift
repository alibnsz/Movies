//
//  ApiCaller.swift
//  Movies
//
//  Created by Mehmet Ali Bunsuz on 20.08.2025.
//

import Foundation
import Alamofire

struct Constants {
    static let API_KEY = "9258962deecd1e523d68d65d80805203"
    static let baseURL = "https://api.themoviedb.org/3"
}

enum ApiError: Error {
    case failedToGetData
    case decodingFailed
    case unauthorized
    case invalidURL
    case unknown
}

class ApiCaller {
    
    static let shared = ApiCaller()
    
    // MARK: - Generic Request Handler
    private func fetchData<T: Decodable>(
        endpoint: String,
        parameters: [String: Any] = [:],
        completion: @escaping (Result<T, ApiError>) -> Void
    ) {
        guard let url = URL(string: "\(Constants.baseURL)\(endpoint)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var allParameters = parameters
        allParameters["api_key"] = Constants.API_KEY
        
        AF.request(url, parameters: allParameters)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decoded))
                    } catch {
                        print("❌ Decoding error: \(error)")
                        completion(.failure(.decodingFailed))
                    }
                case .failure(let error):
                    print("❌ Network error: \(error)")
                    if let afError = error.asAFError, afError.responseCode == 401 {
                        completion(.failure(.unauthorized))
                    } else {
                        completion(.failure(.failedToGetData))
                    }
                }
            }
    }
    
    // MARK: - Public API Calls
    
    /// Fetch trending movies (daily)
    func getTrendingMovies(completion: @escaping (Result<[Title], ApiError>) -> Void) {
        fetchData(endpoint: "/trending/movie/day") { (result: Result<TitleResponse, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetch trending TV shows (daily)
    func getTrendingTVShows(completion: @escaping (Result<[Title], ApiError>) -> Void) {
        fetchData(endpoint: "/trending/tv/day") { (result: Result<TitleResponse, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetch upcoming movies
    func getUpcomingMovies(completion: @escaping (Result<[Title], ApiError>) -> Void) {
        fetchData(
            endpoint: "/movie/upcoming",
            parameters: ["language": "en-US", "page": 1]
        ) { (result: Result<TitleResponse, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetch popular movies
    func getPopularMovies(completion: @escaping (Result<[Title], ApiError>) -> Void) {
        fetchData(
            endpoint: "/movie/popular",
            parameters: ["language": "en-US", "page": 1]
        ) { (result: Result<TitleResponse, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetch popular movies
    func getTopRatedMovies(completion: @escaping (Result<[Title], ApiError>) -> Void) {
        fetchData(
            endpoint: "/movie/top_rated",
            parameters: ["language": "en-US", "page": 1]
        ) { (result: Result<TitleResponse, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
}
