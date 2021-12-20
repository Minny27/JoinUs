//
//  PlayerCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import UIKit

final class TeamPlayerCollectionViewCell: UICollectionViewCell {
    static let identifier = "playerCollectionViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.systemBlue.cgColor
        
        return view
    }()
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let playerRoleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        
        return label
    }()
    
    let playerGameIdLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(playerImageView)
        containerView.addSubview(playerRoleLabel)
        containerView.addSubview(playerGameIdLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        playerRoleLabel.translatesAutoresizingMaskIntoConstraints = false
        playerGameIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            playerImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            playerImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            playerImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40),
            playerImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            playerRoleLabel.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: 3),
            playerRoleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerRoleLabel.heightAnchor.constraint(equalToConstant: 10),
            
            playerGameIdLabel.topAnchor.constraint(equalTo: playerRoleLabel.bottomAnchor, constant: 2),
            playerGameIdLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerGameIdLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    func update(playerInfo: Player) {
        playerImageView.image = UIImage(named: playerInfo.imageString)
        playerRoleLabel.text = playerInfo.role
        playerGameIdLabel.text = playerInfo.gameId
        containerView.layer.borderColor = playerInfo.teamColor.cgColor
    }
}
