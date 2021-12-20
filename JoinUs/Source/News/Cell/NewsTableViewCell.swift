//
//  NewsTableViewCell.swift.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/26.
//

import Foundation
import UIKit

final class NewsTableViewCell: UITableViewCell {
    static let identifier = "newsTableViewCell"
    
    let photoFrameView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let newsDataView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 2
        
        return label
    }()
    
    let newsEtcLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .lightGray
        
        return label
    }()
    
    func configureCell() {
        contentView.addSubview(photoFrameView)
        contentView.addSubview(newsDataView)
        photoFrameView.addSubview(photoImageView)
        newsDataView.addSubview(newsTitleLabel)
        newsDataView.addSubview(newsEtcLabel)
        
        photoFrameView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        newsDataView.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsEtcLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoFrameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            photoFrameView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            photoFrameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            photoFrameView.widthAnchor.constraint(equalToConstant: 110),
            
            photoImageView.topAnchor.constraint(equalTo: photoFrameView.topAnchor),
            photoImageView.leftAnchor.constraint(equalTo: photoFrameView.leftAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            newsDataView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            newsDataView.leftAnchor.constraint(equalTo: photoFrameView.rightAnchor),
            newsDataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            newsDataView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            newsTitleLabel.topAnchor.constraint(equalTo: newsDataView.topAnchor),
            newsTitleLabel.leftAnchor.constraint(equalTo: newsDataView.leftAnchor),
            newsTitleLabel.rightAnchor.constraint(equalTo: newsDataView.rightAnchor),
            newsTitleLabel.heightAnchor.constraint(equalToConstant: 36),
            
            newsEtcLabel.leftAnchor.constraint(equalTo: newsDataView.leftAnchor),
            newsEtcLabel.bottomAnchor.constraint(equalTo: newsDataView.bottomAnchor),
            newsEtcLabel.rightAnchor.constraint(equalTo: newsDataView.rightAnchor),
            newsEtcLabel.heightAnchor.constraint(equalToConstant: 12),
        ])
    }
    
    func update(newsInfo: News) {
        self.photoImageView.image = UIImage(data: newsInfo.photo)
        self.newsTitleLabel.text = newsInfo.title
        self.newsEtcLabel.text = newsInfo.etc
    }
}
