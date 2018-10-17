//
//  ArticleService.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Moya
import ReactiveSwift
import Result
import Moya_ModelMapper

class ArticleService: NSObject {
    var provider: CarsProvider
    var logger: LoggerProtocol
    
    init(provider: CarsProvider, logger: LoggerProtocol) {
        self.provider = provider
        self.logger = logger
    }
}

extension ArticleService: ArticleServiceProtocol {
    func getAllArticles(completion: @escaping (Result<ArticleResponse, ResponseError<ArticleServiceError>>) -> Void) {
        provider.reactive.request(.getArticleList).map(to: ArticleResponse.self).startWithResult({ (result) in
            guard let articles = result.value else {
                if let statusCode = result.error?.response?.statusCode {
                    completion(Result(error: ResponseError<ArticleServiceError>(ArticleServiceError(statusCode: statusCode))))
                } else {
                    completion(Result(error: ResponseError<ArticleServiceError>(NetworkError(result.error))))
                }
                return
            }
            let result: Result<ArticleResponse, ResponseError<ArticleServiceError>> = Result(value: articles)
            completion(result)
        })
    }
}
