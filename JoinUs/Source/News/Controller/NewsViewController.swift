//
//  NewsViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Properties
    var newsTableViewModel = NewsTableViewModel()
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(
            self,
            action: #selector(newsRefresh),
            for: .valueChanged
        )
        return refreshControl
    }()

    let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.showsVerticalScrollIndicator = false
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let customActivityIndicatorView = CustomActivityIndicatorView()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupNewsTableView()
        setupLoadingView()
        fetchData()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "LOL 뉴스"
    }
    
    func setupNewsTableView() {
        view.addSubview(newsTableView)
        
        newsTableView.register(
            NewsTableViewCell.self,
            forCellReuseIdentifier: NewsTableViewCell.identifier
        )
        
        newsTableView.dataSource = self
        newsTableView.delegate = self

        newsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        newsTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        newsTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        newsTableView.addSubview(refreshControl)
    }
    
    func setupLoadingView() {
        view.addSubview(customActivityIndicatorView)
        customActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        customActivityIndicatorView.centerXAnchor.constraint(equalTo: newsTableView.centerXAnchor).isActive = true
        customActivityIndicatorView.centerYAnchor.constraint(equalTo: newsTableView.centerYAnchor).isActive = true
        customActivityIndicatorView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        customActivityIndicatorView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func fetchData() {
        newsTableViewModel.fetchNewsData()
        
        newsTableViewModel.newsList.bind { _ in
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
    }
    
    func clearData() {
        newsTableViewModel = NewsTableViewModel()
        newsTableView.reloadData()
    }
    
    @objc func newsRefresh() {
        clearData()
        fetchData()
        refreshControl.endRefreshing()
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return newsTableViewModel.countNewsList
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsTableViewCell.identifier,
            for: indexPath
        ) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        if newsTableViewModel.countNewsList > 0 {
            customActivityIndicatorView.loadingView.stopAnimating()
        }
        
        let newsInfo = newsTableViewModel.newsInfo(at: indexPath.row)
        
        cell.selectionStyle = .none
        cell.setupCell()
        cell.update(newsInfo: newsInfo!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let newsDetailViewController = NewsDetailViewController()
        
        newsDetailViewController.newsDetailUrlString = newsTableViewModel.newsInfo(at: indexPath.row)!.detailUrlString
        
        self.navigationController?.pushViewController(
            newsDetailViewController,
            animated: true
        )
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
