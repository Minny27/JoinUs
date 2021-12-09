//
//  PlayerTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/08.
//

import Foundation
import UIKit

final class PlayerTableViewCell: UITableViewCell {
    static let identifier = "playerTableViewCell"
    
    let imageFrameView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let playerTeamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        
        return label
    }()
    
    let playerName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        
        return label
    }()
    
    func configureCell() {
        contentView.addSubview(imageFrameView)
        contentView.addSubview(containerView)
        imageFrameView.addSubview(playerImageView)
        containerView.addSubview(playerTeamLabel)
        containerView.addSubview(playerName)
        
        imageFrameView.translatesAutoresizingMaskIntoConstraints = false
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        playerTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        playerName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageFrameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageFrameView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            imageFrameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageFrameView.widthAnchor.constraint(equalToConstant: 110),
            
            playerImageView.topAnchor.constraint(equalTo: imageFrameView.topAnchor),
            playerImageView.leftAnchor.constraint(equalTo: imageFrameView.leftAnchor),
            playerImageView.bottomAnchor.constraint(equalTo: imageFrameView.bottomAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: 100),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leftAnchor.constraint(equalTo: imageFrameView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            playerName.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            playerName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            playerName.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            playerName.heightAnchor.constraint(equalToConstant: 17),
            
            playerTeamLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            playerTeamLabel.bottomAnchor.constraint(equalTo: playerName.topAnchor, constant: -5),
            playerTeamLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            playerTeamLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func update(playerInfo: PlayerModel) {
        playerImageView.image = UIImage(named: playerInfo.playerImageName)
        playerTeamLabel.text = playerInfo.teamName
        playerTeamLabel.textColor = playerInfo.teamColor
        playerName.text = playerInfo.playerName
    }
}
