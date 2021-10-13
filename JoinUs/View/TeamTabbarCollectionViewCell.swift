//
//  teamTabbarCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import UIKit

final class TeamTabbarCollectionViewCell: UICollectionViewCell {
    static let identifier = "TeamTabbarCollectionViewCell"
    let teamLabelWidth: [CGFloat] = [70, 65, 25, 35, 35, 70, 65, 50, 30, 45]
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(index: Int?, width: CGFloat?) {
        if index  == nil || width == nil {
            return
        }
        
        contentView.addSubview(teamLabel)
        contentView.addSubview(teamImageView)
        
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: (width! - 20 - 5 - teamLabelWidth[index!])),
            teamImageView.widthAnchor.constraint(equalToConstant: 20),
            teamImageView.heightAnchor.constraint(equalToConstant: 20),
            
            teamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamLabel.leftAnchor.constraint(equalTo: teamImageView.rightAnchor, constant: 5),
            teamLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func update(teamInfo: TeamModel) {
        teamLabel.text = teamInfo.teamName
        teamImageView.image = UIImage(named: teamInfo.teamImageName)
    }
}
