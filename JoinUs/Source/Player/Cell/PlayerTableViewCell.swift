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
    
    let playerGameIdLabel: UILabel = {
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
        containerView.addSubview(playerGameIdLabel)
        
        imageFrameView.translatesAutoresizingMaskIntoConstraints = false
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        playerTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        playerGameIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            playerGameIdLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            playerGameIdLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            playerGameIdLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            playerGameIdLabel.heightAnchor.constraint(equalToConstant: 17),
            
            playerTeamLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            playerTeamLabel.bottomAnchor.constraint(equalTo: playerGameIdLabel.topAnchor, constant: -5),
            playerTeamLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            playerTeamLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func update(playerInfo: Player) {
        playerImageView.image = UIImage(named: playerInfo.imageString)
        playerTeamLabel.text = playerInfo.team
        playerTeamLabel.textColor = playerInfo.teamColor
        playerGameIdLabel.text = playerInfo.gameId
    }
}
