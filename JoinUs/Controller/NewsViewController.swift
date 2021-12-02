//
//  NewsViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Properties
    let newsTableViewModel = NewsTableViewModel()
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Esports News"
        
        return label
    }()
    
    let popularityOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("인기순", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    let RecentOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("최신순", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        newsTableViewModel.newsList.bind { _ in
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
        
        newsTableViewModel.fetchNewsData()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(containerView)
        view.addSubview(newsTableView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(popularityOrderButton)
        containerView.addSubview(RecentOrderButton)
        
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityOrderButton.translatesAutoresizingMaskIntoConstraints = false
        RecentOrderButton.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            
            RecentOrderButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            RecentOrderButton.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            RecentOrderButton.widthAnchor.constraint(equalToConstant: 40),
            RecentOrderButton.heightAnchor.constraint(equalToConstant: 17),
            
            popularityOrderButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            popularityOrderButton.rightAnchor.constraint(equalTo: RecentOrderButton.leftAnchor),
            popularityOrderButton.widthAnchor.constraint(equalToConstant: 40),
            popularityOrderButton.heightAnchor.constraint(equalToConstant: 17),
            
            newsTableView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            newsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel.countNewsList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        let newsInfo = newsTableViewModel.newsInfo(at: indexPath.row)
        
        cell.configureCell()
        cell.update(newsInfo: newsInfo!)
        
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
