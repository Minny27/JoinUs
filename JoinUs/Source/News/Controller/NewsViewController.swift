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
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LOL News"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let popularityOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("인기순", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let RecentOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("최신순", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(
            top: 0,
            left: 10,
            bottom: 0,
            right: 10
        )
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
        
        setupTitle()
        setupNewsTableView()
        setupLoadingView()
        fetchData()
    }
    
    func setupTitle() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        containerView.addSubview(RecentOrderButton)
        RecentOrderButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        RecentOrderButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        RecentOrderButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        RecentOrderButton.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        containerView.addSubview(popularityOrderButton)
        popularityOrderButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        popularityOrderButton.rightAnchor.constraint(equalTo: RecentOrderButton.leftAnchor).isActive = true
        popularityOrderButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        popularityOrderButton.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
    func setupNewsTableView() {
        view.addSubview(newsTableView)
        
        newsTableView.register(
            NewsTableViewCell.self,
            forCellReuseIdentifier: NewsTableViewCell.identifier
        )
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        newsTableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20).isActive = true
        newsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        newsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        newsTableView.refreshControl = refreshControl
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
        cell.configureCell()
        cell.update(newsInfo: newsInfo!)
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let refreshControl = newsTableView.refreshControl {
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 80
    }
    
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
}
