//
//  CarsAPI.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import Moya

typealias CarsProvider = MoyaProvider<CarsAPI>

enum CarsAPI {
    case getArticleList
}

extension CarsAPI: TargetType {
    static var baseURL: URL {
        return URL(string: "your-base-url")!
    }
    
    var baseURL: URL {
        return CarsAPI.baseURL
    }
    
    var path: String {
        switch self {
        case .getArticleList: return "/article/get_articles_list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getArticleList: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getArticleList:
            let params: [String:Any] = [:]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        switch self {
        default: return [:]
        }
    }
}
