//
//  PlayerBackgroundDataTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/14.
//

import UIKit

final class PlayerDetailCell: UITableViewCell {
    static let identifier = "PlayerDetailCell"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        contentView.addSubview(categoryLabel)
        categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 2 / 10).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: categoryLabel.rightAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    func update(category: String, description: String, teamColor: UIColor) {
        categoryLabel.text = category
        categoryLabel.backgroundColor = teamColor
        descriptionLabel.text = description
    }
}
