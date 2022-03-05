//
//  StandingsTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/25.
//

import Kingfisher
import UIKit

final class StandingsTableViewCell: UITableViewCell {
    static let identifier = "standingsTableViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rankingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let losesLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winRateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pointLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupCell() {
        let contentViewWidth = contentView.frame.width - 40 - 5
        
        contentView.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        containerView.addSubview(rankingLabel)
        rankingLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        rankingLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        rankingLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        rankingLabel.widthAnchor.constraint(equalToConstant: contentViewWidth / 10).isActive = true
        
        containerView.addSubview(teamImageView)
        teamImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        teamImageView.leftAnchor.constraint(equalTo: rankingLabel.rightAnchor).isActive = true
        teamImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        teamImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerView.addSubview(teamLabel)
        teamLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        teamLabel.leftAnchor.constraint(equalTo: teamImageView.rightAnchor, constant: 5).isActive = true
        teamLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        teamLabel.widthAnchor.constraint(equalToConstant: contentViewWidth * 4 / 10).isActive = true
        
        containerView.addSubview(winsLabel)
        winsLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        winsLabel.leftAnchor.constraint(equalTo: teamLabel.rightAnchor).isActive = true
        winsLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        winsLabel.widthAnchor.constraint(equalToConstant: contentViewWidth / 10).isActive = true
        
        containerView.addSubview(losesLabel)
        losesLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        losesLabel.leftAnchor.constraint(equalTo: winsLabel.rightAnchor).isActive = true
        losesLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        losesLabel.widthAnchor.constraint(equalToConstant: contentViewWidth / 10).isActive = true
        
        containerView.addSubview(winRateLabel)
        winRateLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        winRateLabel.leftAnchor.constraint(equalTo: losesLabel.rightAnchor).isActive = true
        winRateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        winRateLabel.widthAnchor.constraint(equalToConstant: contentViewWidth * 2 / 10).isActive = true
        
        containerView.addSubview(pointLabel)
        pointLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        pointLabel.leftAnchor.constraint(equalTo: winRateLabel.rightAnchor).isActive = true
        pointLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        pointLabel.widthAnchor.constraint(equalToConstant: contentViewWidth / 10).isActive = true
    }
    
    func update(standingsInfo: Standings) {
        rankingLabel.text = standingsInfo.ranking
        setTeamImage(
            teamImageUrl: standingsInfo.teamImageUrl,
            teamImageView: teamImageView
        )
        teamLabel.text = standingsInfo.team
        winsLabel.text = standingsInfo.wins
        losesLabel.text = standingsInfo.loses
        winRateLabel.text = standingsInfo.winRate
        pointLabel.text = standingsInfo.point
    }
    
    func setTeamImage(teamImageUrl: URL, teamImageView: UIImageView) {
        let processor = DownsamplingImageProcessor(size: CGSize(width: 20, height: 20))
        teamImageView.kf.indicatorType = .activity
        teamImageView.kf.setImage(
            with: teamImageUrl,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
//        {
//            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
//        }
    }
}
