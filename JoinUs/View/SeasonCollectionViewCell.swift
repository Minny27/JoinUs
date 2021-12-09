//
//  SeasonCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/30.
//

import UIKit

final class SeasonCollectionViewCell: UICollectionViewCell {
    static let identifier = "seasonCollectionViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .lightGray
        
        return label
    }()
    
    let seasonLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .lightGray
        
        return label
    }()
    
    func configureCell() {
        contentView.addSubview(containerView)
        containerView.addSubview(yearLabel)
        containerView.addSubview(seasonLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 30),
            
            yearLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            yearLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            yearLabel.widthAnchor.constraint(equalToConstant: 40),
            yearLabel.heightAnchor.constraint(equalToConstant: 15),
            
            seasonLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor),
            seasonLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            seasonLabel.widthAnchor.constraint(equalToConstant: 80),
            seasonLabel.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
    
    func update(seasonInfo: Season) {
        yearLabel.text = seasonInfo.year
        seasonLabel.text = seasonInfo.seasonName
    }
}
