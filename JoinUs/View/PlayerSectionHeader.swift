//
//  PlayerSectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/21.
//

import UIKit

class PlayerSectionHeader: UIView {
    let playerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LCK Player"
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(playerTitleLabel)
        
        playerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playerTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            playerTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            playerTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            playerTitleLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
