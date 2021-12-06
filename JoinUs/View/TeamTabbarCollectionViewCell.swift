//
//  teamTabbarCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import UIKit

final class TeamTabbarCollectionViewCell: UICollectionViewCell {
    static let identifier = "teamTabbarCollectionViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.3
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
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
        
        contentView.addSubview(containerView)
        containerView.addSubview(teamLabel)
        containerView.addSubview(teamImageView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 30),
            
            teamImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            teamImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            teamImageView.widthAnchor.constraint(equalToConstant: 20),
            teamImageView.heightAnchor.constraint(equalToConstant: 20),
            
            teamLabel.leftAnchor.constraint(equalTo: teamImageView.rightAnchor, constant: 5),
            teamLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            teamLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func update(teamInfo: TeamModel) {
        teamLabel.text = teamInfo.teamName
        teamImageView.image = UIImage(named: teamInfo.teamImageName)
    }
}
