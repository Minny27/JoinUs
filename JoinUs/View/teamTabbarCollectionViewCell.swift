//
//  teamTabbarCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import UIKit

final class TeamTabbarCollectionViewCell: UICollectionViewCell {
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configueUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configueUI() {
        contentView.addSubview(teamLabel)
        contentView.addSubview(teamImageView)
        
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                                constant: (contentView.frame.width - 20 - 5 - 70) / 2),
            teamImageView.widthAnchor.constraint(equalToConstant: 20),
            teamImageView.heightAnchor.constraint(equalToConstant: 20),
            
            teamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamLabel.leftAnchor.constraint(equalTo: teamImageView.rightAnchor, constant: 5),
            teamLabel.widthAnchor.constraint(equalToConstant: 70),
            teamLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func update(teamInfo: TeamModel) {
        teamLabel.text = teamInfo.teamName
        teamImageView.image = UIImage(named: teamInfo.teamImageName)
    }
}
