//
//  LeagueTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/05.
//

import Kingfisher
import UIKit

final class LeagueScheduleTableViewCell: UITableViewCell {
    static let identifier = "leagueScheduleTableViewCell"
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        label.layer.borderWidth = 0.3
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let homeTeam: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let homeTeamWins: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let versusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let awayTeam: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let awayTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let awayTeamWins: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        let contentViewWidth = contentView.frame.width - 88
        
        contentView.addSubview(timeLabel)
        timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: contentViewWidth * 3 / 20 + 10).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(statusLabel)
        statusLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 5).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: contentViewWidth * 3 / 20 + 10).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(homeTeam)
        homeTeam.leftAnchor.constraint(equalTo: statusLabel.rightAnchor, constant: 5).isActive = true
        homeTeam.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        homeTeam.widthAnchor.constraint(equalToConstant: contentViewWidth * 6 / 20 - 20).isActive = true
        homeTeam.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(homeTeamImageView)
        homeTeamImageView.leftAnchor.constraint(equalTo: homeTeam.rightAnchor, constant: 5).isActive = true
        homeTeamImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        homeTeamImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        homeTeamImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(homeTeamWins)
        homeTeamWins.leftAnchor.constraint(equalTo: homeTeamImageView.rightAnchor, constant: 8).isActive = true
        homeTeamWins.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        homeTeamWins.widthAnchor.constraint(equalToConstant: contentViewWidth / 20 / 2 + 5).isActive = true
        homeTeamWins.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(versusLabel)
        versusLabel.leftAnchor.constraint(equalTo: homeTeamWins.rightAnchor).isActive = true
        versusLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        versusLabel.widthAnchor.constraint(equalToConstant: contentViewWidth / 20 + 10).isActive = true
        versusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(awayTeamWins)
        awayTeamWins.leftAnchor.constraint(equalTo: versusLabel.rightAnchor).isActive = true
        awayTeamWins.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        awayTeamWins.widthAnchor.constraint(equalToConstant: contentViewWidth / 20 / 2 + 5).isActive = true
        awayTeamWins.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(awayTeamImageView)
        awayTeamImageView.leftAnchor.constraint(equalTo: awayTeamWins.rightAnchor, constant: 8).isActive = true
        awayTeamImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        awayTeamImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        awayTeamImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(awayTeam)
        awayTeam.leftAnchor.constraint(equalTo: awayTeamImageView.rightAnchor, constant: 5).isActive = true
        awayTeam.centerYAnchor.constraint(equalTo: awayTeamImageView.centerYAnchor).isActive = true
        awayTeam.widthAnchor.constraint(equalToConstant: contentViewWidth * 6 / 20 - 20).isActive = true
        awayTeam.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func update(leagueScheduleInfo: LeagueScheduleTableViewCellModel) {
        timeLabel.text = leagueScheduleInfo.time
        let statusType = MatchStatusType(rawValue: leagueScheduleInfo.status)!
        statusLabel.text = statusType.convertKorean()
        statusLabel.textColor = statusType.statusColor()
        statusLabel.layer.borderColor = statusType.statusColor().cgColor
        versusLabel.text = leagueScheduleInfo.versus
        homeTeam.text = leagueScheduleInfo.homeTeam
        homeTeamWins.text = leagueScheduleInfo.status == "not_started" ? "" : String(leagueScheduleInfo.homeTeamWinCount)
        awayTeam.text = leagueScheduleInfo.awayTeam
        awayTeamWins.text = leagueScheduleInfo.status == "not_started" ? "" : String(leagueScheduleInfo.awayTeamWinCount)
        
        if let homeTeamImageUrl = leagueScheduleInfo.homeTeamImageUrl {
            setTeamImage(
                teamImageUrl: homeTeamImageUrl,
                teamImageView: homeTeamImageView
            )
        } else { homeTeamImageView.image = nil }
        
        if let awayTeamImageUrl = leagueScheduleInfo.awayTeamImageUrl {
            setTeamImage(
                teamImageUrl: awayTeamImageUrl,
                teamImageView: awayTeamImageView
            )
        } else { awayTeamImageView.image = nil }
        
        if let winnerId = leagueScheduleInfo.winnerId {
            if winnerId == leagueScheduleInfo.homeTeamId {
                homeTeamWins.textColor = .black
                awayTeamWins.textColor = .darkGray
                
                if statusType == .canceled {
                    homeTeamWins.text = "2"
                }
            } else {
                awayTeamWins.textColor = .black
                homeTeamWins.textColor = .darkGray
                
                if statusType == .canceled {
                    awayTeamWins.text = "2"
                }
            }
        }
        
        let todayDate = DateFormatter().dateToString(date: Date(), dateFormat: .date)
        if leagueScheduleInfo.date == todayDate {
            timeLabel.textColor = .black
            statusLabel.font = .boldSystemFont(ofSize: 13)
        } else {
            timeLabel.textColor = .lightGray
            statusLabel.font = .systemFont(ofSize: 13)
        }
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
