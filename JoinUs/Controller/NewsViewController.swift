//
//  NewsViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit

class NewsViewController: UIViewController {
    let newsTableViewModel = NewsTableViewModel()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Esports News"
        
        return label
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
        view.addSubview(titleLabel)
        view.addSubview(newsTableView)
        
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            newsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
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
        
        let newsInfo = newsTableViewModel.newInfo(at: indexPath.row)
        
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
