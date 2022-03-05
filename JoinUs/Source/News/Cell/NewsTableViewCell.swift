//
//  NewsTableViewCell.swift.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/26.
//

import Kingfisher
import UIKit

final class NewsTableViewCell: UITableViewCell {
    static let identifier = "newsTableViewCell"
    
    let photoFrameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let newsDataView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsEtcLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        contentView.addSubview(photoFrameView)
        photoFrameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        photoFrameView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        photoFrameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        photoFrameView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        photoFrameView.addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: photoFrameView.topAnchor).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: photoFrameView.leftAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: photoFrameView.bottomAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        contentView.addSubview(newsDataView)
        newsDataView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        newsDataView.leftAnchor.constraint(equalTo: photoFrameView.rightAnchor).isActive = true
        newsDataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        newsDataView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        newsDataView.addSubview(newsTitleLabel)
        newsTitleLabel.topAnchor.constraint(equalTo: newsDataView.topAnchor).isActive = true
        newsTitleLabel.leftAnchor.constraint(equalTo: newsDataView.leftAnchor).isActive = true
        newsTitleLabel.rightAnchor.constraint(equalTo: newsDataView.rightAnchor).isActive = true
        newsTitleLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        newsDataView.addSubview(newsEtcLabel)
        newsEtcLabel.leftAnchor.constraint(equalTo: newsDataView.leftAnchor).isActive = true
        newsEtcLabel.bottomAnchor.constraint(equalTo: newsDataView.bottomAnchor).isActive = true
        newsEtcLabel.rightAnchor.constraint(equalTo: newsDataView.rightAnchor).isActive = true
        newsEtcLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
    func update(newsInfo: News) {
        setNewsImage(
            newsImageUrl: newsInfo.photo,
            newsImageView: photoImageView
        )
        self.newsTitleLabel.text = newsInfo.title
        self.newsEtcLabel.text = newsInfo.etc
    }
    
    func setNewsImage(newsImageUrl: URL, newsImageView: UIImageView) {
        let processor = DownsamplingImageProcessor(size: CGSize(
            width: 100,
            height: contentView.frame.height - 10
        )) |> RoundCornerImageProcessor(cornerRadius: 5)
        newsImageView.kf.indicatorType = .activity
        newsImageView.kf.setImage(
            with: newsImageUrl,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
        //        {
        //            result in
        //            switch result {
        //            case .success(let value):
        //                print("Task done for: \(value.source.url?.absoluteString ?? "")")
        //            case .failure(let error):
        //                print("Job failed: \(error.localizedDescription)")
        //            }
        //        }
    }
}
