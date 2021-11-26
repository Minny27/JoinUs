//
//  StandingsTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/25.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {
    static let identifier = "standingsTableViewCell"
    
    let standingsDataView: UIView = {
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
        contentView.addSubview(standingsDataView)
        standingsDataView.addSubview(rankingLabel)
        standingsDataView.addSubview(teamImageView)
        standingsDataView.addSubview(teamLabel)
        standingsDataView.addSubview(winsLabel)
        standingsDataView.addSubview(losesLabel)
        standingsDataView.addSubview(winRateLabel)
        standingsDataView.addSubview(pointLabel)
        
        standingsDataView.translatesAutoresizingMaskIntoConstraints = false
        rankingLabel.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        winsLabel.translatesAutoresizingMaskIntoConstraints = false
        losesLabel.translatesAutoresizingMaskIntoConstraints = false
        winRateLabel.translatesAutoresizingMaskIntoConstraints = false
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            standingsDataView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            standingsDataView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            standingsDataView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            standingsDataView.heightAnchor.constraint(equalToConstant: 30),
            
            rankingLabel.topAnchor.constraint(equalTo: standingsDataView.topAnchor),
            rankingLabel.leftAnchor.constraint(equalTo: standingsDataView.leftAnchor),
            rankingLabel.bottomAnchor.constraint(equalTo: standingsDataView.bottomAnchor),
            rankingLabel.widthAnchor.constraint(equalToConstant: 25),
            
            teamImageView.topAnchor.constraint(equalTo: standingsDataView.topAnchor),
            teamImageView.leftAnchor.constraint(equalTo: rankingLabel.rightAnchor),
            teamImageView.bottomAnchor.constraint(equalTo: standingsDataView.bottomAnchor),
            teamImageView.widthAnchor.constraint(equalToConstant: 40),
            
            teamLabel.topAnchor.constraint(equalTo: standingsDataView.topAnchor),
            teamLabel.leftAnchor.constraint(equalTo: teamImageView.rightAnchor),
            teamLabel.bottomAnchor.constraint(equalTo: standingsDataView.bottomAnchor),
            teamLabel.widthAnchor.constraint(equalToConstant: 100),
            
            winsLabel.topAnchor.constraint(equalTo: standingsDataView.topAnchor),
            winsLabel.leftAnchor.constraint(equalTo: teamLabel.rightAnchor),
            winsLabel.bottomAnchor.constraint(equalTo: standingsDataView.bottomAnchor),
            winsLabel.widthAnchor.constraint(equalToConstant: 25),
            
            losesLabel.topAnchor.constraint(equalTo: standingsDataView.topAnchor),
            losesLabel.leftAnchor.constraint(equalTo: winsLabel.rightAnchor),
            losesLabel.bottomAnchor.constraint(equalTo: standingsDataView.bottomAnchor),
            losesLabel.widthAnchor.constraint(equalToConstant: 25),
            
            winRateLabel.topAnchor.constraint(equalTo: standingsDataView.topAnchor),
            winRateLabel.leftAnchor.constraint(equalTo: losesLabel.rightAnchor),
            winRateLabel.bottomAnchor.constraint(equalTo: standingsDataView.bottomAnchor),
            winRateLabel.widthAnchor.constraint(equalToConstant: 50),
            
            pointLabel.topAnchor.constraint(equalTo: standingsDataView.topAnchor),
            pointLabel.leftAnchor.constraint(equalTo: winRateLabel.rightAnchor),
            pointLabel.bottomAnchor.constraint(equalTo: standingsDataView.bottomAnchor),
            pointLabel.widthAnchor.constraint(equalToConstant: 35),
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
