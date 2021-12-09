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
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "arrow.left"),
            for: .normal
        )
        button.tintColor = .lightGray
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        
        button.addTarget(
            self,
            action: #selector(clickBackButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
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
        view.addSubview(backButton)
        view.addSubview(newsDetailView)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.imageView!.translatesAutoresizingMaskIntoConstraints = false
        newsDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            
            backButton.imageView!.topAnchor.constraint(equalTo: backButton.topAnchor),
            backButton.imageView!.leftAnchor.constraint(equalTo: backButton.leftAnchor),
            backButton.imageView!.bottomAnchor.constraint(equalTo: backButton.bottomAnchor),
            backButton.imageView!.rightAnchor.constraint(equalTo: backButton.rightAnchor),
            
            newsDetailView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
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
        dismiss(
            animated: false,
            completion: nil
        )
    }
}
