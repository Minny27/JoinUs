//
//  NewsDetailViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/07.
//

import Foundation
import UIKit
import WebKit

class NewsDetailViewController: UIViewController {
    var newsDetailUrlString = ""
    
    // MARK: - Properties
    let newsDetailView: WKWebView = {
        let webView = WKWebView()
        
        return webView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        loadWebView(newsDetailUrlString: newsDetailUrlString)
    }
    
    func configureUI() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = .lightGray
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(clickBackButton)
        )
        
        view.backgroundColor = .white
        view.addSubview(newsDetailView)
        
        newsDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsDetailView.leftAnchor.constraint(equalTo: view.leftAnchor),
            newsDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsDetailView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func loadWebView(newsDetailUrlString: String) {
        guard let newsDetailUrl = URL(string: newsDetailUrlString) else {
            print(NetworkError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: newsDetailUrl)
        newsDetailView.load(request)
    }
    
    @objc func clickBackButton() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.popViewController(animated: true)
    }
}
