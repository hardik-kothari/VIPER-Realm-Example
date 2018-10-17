//
//  ArticleListPresenter.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright (c) 2561 Hardik Kothari. All rights reserved.
//

import UIKit

final class ArticleListPresenter {
    
    // MARK: - Private properties -
    private unowned var _view: ArticleListViewInterface
    private var _interactor: ArticleListInteractorInterface
    private var _wireframe: ArticleListWireframeInterface
    
    // MARK: - Lifecycle -
    init(wireframe: ArticleListWireframeInterface, view: ArticleListViewInterface, interactor: ArticleListInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
}

// MARK: - Extensions -
extension ArticleListPresenter: ArticleListPresenterInterface {
    func getAllArticles() {
        _interactor.getArticlesFromServer() { [weak self] (response) in
            guard let weakSelf = self else { return }
            
            guard let articleResponse = response.value, articleResponse.articleList.count > 0 else {
                var errorMessage: String = "Something went wrong. Please try again later."
                if let error = response.error?.serviceError {
                    switch error {
                    case .noArticlesFound:
                        errorMessage = "No articles found for you."
                    case .unknown:
                        errorMessage = "Some error has occured. Please try again later."
                    }
                } else if let error = response.error?.networkError {
                    switch error {
                    case .noInternet:
                        errorMessage = "Please check your internet connection."
                    case .timeout:
                        errorMessage = "Request timeout. Please try again."
                    case .internalError(_):
                        errorMessage = "Some internal error has occured. Please try again later."
                    }
                }
                weakSelf._view.showErrorMessage(errorMessage)
                let articleList: [Article] = weakSelf._interactor.getArticlesFromRealm()
                weakSelf._view.showArticleList(articleList)
                return
            }
            weakSelf._interactor.saveArticlesInRealm(articleResponse.articleList, completion: {
                weakSelf._view.showArticleList(articleResponse.articleList)
            })
        }
    }
}
