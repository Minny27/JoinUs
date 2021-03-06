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
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNewsDetailView()
        loadWebView(newsDetailUrlString: newsDetailUrlString)
    }
    
    func setupNewsDetailView() {
        view.addSubview(newsDetailView)
        newsDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        newsDetailView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        newsDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        newsDetailView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
    
    func loadWebView(newsDetailUrlString: String) {
        guard let newsDetailUrl = URL(string: newsDetailUrlString) else {
            print(NetworkError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: newsDetailUrl)
        newsDetailView.load(request)
    }
}
