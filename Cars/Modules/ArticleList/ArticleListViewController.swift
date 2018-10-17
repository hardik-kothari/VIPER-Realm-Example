//
//  ArticleListViewController.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright (c) 2561 Hardik Kothari. All rights reserved.
//

import UIKit

final class ArticleListViewController: UIViewController {

    // MARK: - IBOutlets -
    @IBOutlet weak var tblArticles: UITableView!

    // MARK: - Public properties -
    var presenter: ArticleListPresenterInterface!
    var articleList: [Article] = []

    // MARK: - Private properties -
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewAndRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getArticleListFromServer()
    }
    
    func setupTableViewAndRefreshControl() {
        tblArticles.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
        tblArticles.refreshControl = refreshControl
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(refreshArticleList(_:)), for: .valueChanged)
    }
    
    @objc private func refreshArticleList(_ sender: Any) {
        getArticleListFromServer()
    }
    
    func getArticleListFromServer() {
        showActivityIndicator()
        presenter.getAllArticles()
    }
}

// MARK: - View Interface -
extension ArticleListViewController: ArticleListViewInterface {
    func showErrorMessage(_ errorMessage: String) {
        hideActivityIndicator()
        refreshControl.endRefreshing()
        let alertController: UIAlertController = UIAlertController(title: "Cars", message: errorMessage, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showArticleList(_ articleList: [Article]) {
        refreshControl.endRefreshing()
        hideActivityIndicator()
        self.articleList = articleList
        tblArticles.reloadData()
    }
}

// MARK: - TableView Data Source -
extension ArticleListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        cell.setArticleDetails(articleList[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate -
extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let articleCell = cell as? ArticleCell {
            articleCell.gradientLayer.frame = CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height)
        }
    }
}
