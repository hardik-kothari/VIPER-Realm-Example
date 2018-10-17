//
//  ArticleListWireframe.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright (c) 2561 Hardik Kothari. All rights reserved.
//

import UIKit

final class ArticleListWireframe: BaseWireframe {

    // MARK: - Private properties -
    private let _storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -
    init() throws {
        let moduleViewController = _storyboard.instantiateViewController(ofType: ArticleListViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ArticleListInteractor(articleService: try ServiceCenter.inject())
        let presenter = ArticleListPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
}

// MARK: - Extensions -
extension ArticleListWireframe: ArticleListWireframeInterface {

}
