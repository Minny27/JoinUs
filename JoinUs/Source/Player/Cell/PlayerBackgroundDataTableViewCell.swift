//
//  PlayerBackgroundDataTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/14.
//

import UIKit

final class PlayerBackgroundDataTableViewCell: UITableViewCell {
    static let identifier = "playerBackgroundDataTableViewCell"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()

    func configureCell() {
        contentView.addSubview(categoryLabel)
        contentView.addSubview(contentLabel)
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 2 / 10),
            
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentLabel.leftAnchor.constraint(equalTo: categoryLabel.rightAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
}
