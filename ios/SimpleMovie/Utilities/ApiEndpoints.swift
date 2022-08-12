//
//  ApiEndpoints.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import Foundation

enum ApiEndpoints {
    case moviePopular(page: Int)
    case movieDetail(id: Int)
}

extension ApiEndpoints: Endpoint {
    var path: String {
        switch self {
        case .moviePopular(let page):
            return "movie/popular?page=\(page)"
        case .movieDetail(let id):
            return "movie/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .moviePopular, .movieDetail:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .moviePopular, .movieDetail:
            return [
                "Authorization": "Bearer \(API_KEY)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .moviePopular, .movieDetail:
            return nil
        }
    }
}
