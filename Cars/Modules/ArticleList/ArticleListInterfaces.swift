//
//  ArticleListInterfaces.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright (c) 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import Result

protocol ArticleListWireframeInterface: class {
}

protocol ArticleListViewInterface: class {
    func showArticleList(_ articles: [Article])
    func showErrorMessage(_ errorMessage: String)
}

protocol ArticleListPresenterInterface: class {
    func getAllArticles()
}

protocol ArticleListInteractorInterface: class {
    func getArticlesFromServer(completion: @escaping (Result<ArticleResponse, ResponseError<ArticleServiceError>>) -> Void)
    func getArticlesFromRealm() -> [Article]
    func saveArticlesInRealm(_ articleList: [Article], completion: @escaping () -> Void)
}
