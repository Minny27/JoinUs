//
//  PlayerCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import UIKit

final class PlayerCollectionViewCell: UICollectionViewCell {
    static let identifier = "TeamPlayerPageCollectionViewCell"
    
    let playerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let roleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let playerRoleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let playerRoleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .systemBrown
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playerGameIdLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 10
        contentView.addSubview(playerStackView)
        playerStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        playerStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        playerStackView.addArrangedSubview(playerImageView)
        playerImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        playerImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        playerStackView.addArrangedSubview(roleStackView)
        roleStackView.addArrangedSubview(playerRoleImageView)
        playerRoleImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        playerRoleImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        roleStackView.addArrangedSubview(playerRoleLabel)
        
        playerStackView.addArrangedSubview(playerGameIdLabel)
    }
    
    func update(playerInfo: Player) {
        contentView.layer.borderColor = playerInfo.teamColor.cgColor
        playerImageView.image = UIImage(named: playerInfo.imageString)
        playerRoleImageView.image = UIImage(named: playerInfo.role)
        playerRoleLabel.text = playerInfo.role
        playerGameIdLabel.text = playerInfo.gameId
    }
}
