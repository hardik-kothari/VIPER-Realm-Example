//
//  ArticleServiceProtocol.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Result

enum ArticleServiceError: Error {
    case noArticlesFound
    case unknown
    
    init(statusCode: Int) {
        self = .unknown
    }
}

protocol ArticleServiceProtocol {
    func getAllArticles(completion: @escaping (Result<ArticleResponse, ResponseError<ArticleServiceError>>) -> Void)
}
