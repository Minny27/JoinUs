//
//  PlayerCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import UIKit

final class PlayerCollectionViewCell: UICollectionViewCell {
    static let identifier = "PlayerCollectionViewCell"
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let playerLineLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        
        return label
    }()
    
    let playerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        
        return label
    }()
    
    let playerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.systemBlue.cgColor
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(playerView)
        playerView.addSubview(playerImageView)
        playerView.addSubview(playerLineLabel)
        playerView.addSubview(playerNameLabel)
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        playerLineLabel.translatesAutoresizingMaskIntoConstraints = false
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            playerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            playerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            playerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            playerImageView.topAnchor.constraint(equalTo: playerView.topAnchor, constant: 10),
            playerImageView.centerXAnchor.constraint(equalTo: playerView.centerXAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: 100),
            playerImageView.heightAnchor.constraint(equalToConstant: 100),
            
            playerLineLabel.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: 2),
            playerLineLabel.centerXAnchor.constraint(equalTo: playerView.centerXAnchor),
            playerLineLabel.heightAnchor.constraint(equalToConstant: 10),
            
            playerNameLabel.topAnchor.constraint(equalTo: playerLineLabel.bottomAnchor, constant: 2),
            playerNameLabel.centerXAnchor.constraint(equalTo: playerView.centerXAnchor),
            playerNameLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    func update(playerInfo: PlayerModel) {
        playerImageView.image = UIImage(named: playerInfo.playerImageName)
        playerLineLabel.text = playerInfo.playerLine
        playerNameLabel.text = playerInfo.playerName
    }
}
