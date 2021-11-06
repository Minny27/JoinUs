//
//  teamTabbarCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import UIKit

final class TeamTabbarCollectionViewCell: UICollectionViewCell {
    static let identifier = "teamTabbarCollectionViewCell"
    
    let teamView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(cellIndex: Int?, cellWidth: CGFloat?) {
        if cellIndex  == nil || cellWidth == nil {
            return
        }
        
        contentView.addSubview(teamView)
        teamView.addSubview(teamLabel)
        teamView.addSubview(teamImageView)
        
        teamView.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            teamView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            teamView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            teamView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            teamImageView.leftAnchor.constraint(equalTo: teamView.leftAnchor),
            teamImageView.centerYAnchor.constraint(equalTo: teamView.centerYAnchor),
            teamImageView.widthAnchor.constraint(equalToConstant: 20),
            teamImageView.heightAnchor.constraint(equalToConstant: 20),
            
            teamLabel.leftAnchor.constraint(equalTo: teamImageView.rightAnchor, constant: 5),
            teamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func update(teamInfo: TeamModel) {
        teamLabel.text = teamInfo.teamName
        teamImageView.image = UIImage(named: teamInfo.teamImageName)
    }
}
