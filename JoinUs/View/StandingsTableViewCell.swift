//
//  StandingsTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/25.
//

import UIKit

final class StandingsTableViewCell: UITableViewCell {
    static let identifier = "standingsTableViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let rankingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        
        return label
    }()
    
    let winsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
        
    let losesLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let winRateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let pointLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()

    func configureCell() {
        contentView.addSubview(containerView)
        containerView.addSubview(rankingLabel)
        containerView.addSubview(teamImageView)
        containerView.addSubview(teamLabel)
        containerView.addSubview(winsLabel)
        containerView.addSubview(losesLabel)
        containerView.addSubview(winRateLabel)
        containerView.addSubview(pointLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        rankingLabel.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        winsLabel.translatesAutoresizingMaskIntoConstraints = false
        losesLabel.translatesAutoresizingMaskIntoConstraints = false
        winRateLabel.translatesAutoresizingMaskIntoConstraints = false
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 30),
            
            rankingLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            rankingLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            rankingLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            rankingLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 10 - 10),
            
            teamImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            teamImageView.leftAnchor.constraint(equalTo: rankingLabel.rightAnchor),
            teamImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            teamImageView.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 10),
            
            teamLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            teamLabel.leftAnchor.constraint(equalTo: teamImageView.rightAnchor),
            teamLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            teamLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 10 * 4),
            
            winsLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            winsLabel.leftAnchor.constraint(equalTo: teamLabel.rightAnchor),
            winsLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            winsLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 10),
            
            losesLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            losesLabel.leftAnchor.constraint(equalTo: winsLabel.rightAnchor),
            losesLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            losesLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 10),
            
            winRateLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            winRateLabel.leftAnchor.constraint(equalTo: losesLabel.rightAnchor),
            winRateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            winRateLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 10 + 10),
            
            pointLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            pointLabel.leftAnchor.constraint(equalTo: winRateLabel.rightAnchor),
            pointLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            pointLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 10),
        ])
    }
    
    func update(standingsInfo: Standings) {
        rankingLabel.text = standingsInfo.ranking
        teamImageView.image = UIImage(data: standingsInfo.teamImage)
        teamLabel.text = standingsInfo.team
        winsLabel.text = standingsInfo.wins
        losesLabel.text = standingsInfo.loses
        winRateLabel.text = standingsInfo.winRate
        pointLabel.text = standingsInfo.point
    }
}
