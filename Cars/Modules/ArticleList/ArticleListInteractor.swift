//
//  ArticleListInteractor.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright (c) 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Result

final class ArticleListInteractor {
    
    // MARK: - Private properties -
    private var articleService: ArticleServiceProtocol
    
    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }
}

// MARK: - Extensions -
extension ArticleListInteractor: ArticleListInteractorInterface {
    func getArticlesFromServer(completion: @escaping (Result<ArticleResponse, ResponseError<ArticleServiceError>>) -> Void) {
        articleService.getAllArticles {
            completion($0)
        }
    }
    
    func getArticlesFromRealm() -> [Article] {
        let repository = RealmService<ArticleRealm>()
        return repository.fetchAll()
    }
    
    func saveArticlesInRealm(_ articleList: [Article], completion: @escaping () -> Void) {
        do {
            let repository = RealmService<ArticleRealm>()
            try repository.deleteAll()
            try repository.save(items: articleList)
            completion()
        } catch let error {
            print(error.localizedDescription)
            completion()
        }
    }
}
