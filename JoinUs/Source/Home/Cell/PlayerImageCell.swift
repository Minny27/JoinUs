//
//  PlayerImageCell.swift
//  JoinUs
//
//  Created by SeungMin on 2022/03/07.
//

import UIKit

class PlayerImageCell: UITableViewCell {
    static let identifier = "PlayerImageCell"
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupCell() {
        contentView.addSubview(playerImageView)
        playerImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        playerImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        playerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        playerImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12).isActive = true
    }
    
    func update(playerInfo: Player) {
        playerImageView.image = UIImage(named: playerInfo.imageString)
    }
}
