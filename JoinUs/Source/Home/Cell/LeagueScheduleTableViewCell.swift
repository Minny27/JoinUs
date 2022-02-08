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
    
    let leftDataView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.layer.borderWidth = 0.3
        label.layer.cornerRadius = 5
        
        return label
    }()
    
    let homeTeamView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let homeTeam: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .right
        
        return label
    }()
    
    let homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let homeTeamWins: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .right
        
        return label
    }()
    
    let versusView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let versusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let awayTeamView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let awayTeam: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    let awayTeamImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let awayTeamWins: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    func configureUI() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(leftDataView)
        contentView.addSubview(homeTeamView)
        contentView.addSubview(versusView)
        contentView.addSubview(awayTeamView)
        leftDataView.addSubview(timeLabel)
        leftDataView.addSubview(statusLabel)
        homeTeamView.addSubview(homeTeam)
        homeTeamView.addSubview(homeTeamImageView)
        homeTeamView.addSubview(homeTeamWins)
        versusView.addSubview(versusLabel)
        awayTeamView.addSubview(awayTeam)
        awayTeamView.addSubview(awayTeamImageView)
        awayTeamView.addSubview(awayTeamWins)
        
        leftDataView.translatesAutoresizingMaskIntoConstraints = false
        homeTeamView.translatesAutoresizingMaskIntoConstraints = false
        awayTeamView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTeam.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        homeTeamWins.translatesAutoresizingMaskIntoConstraints = false
        versusView.translatesAutoresizingMaskIntoConstraints = false
        versusLabel.translatesAutoresizingMaskIntoConstraints = false
        awayTeam.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        awayTeamWins.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftDataView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            leftDataView.widthAnchor.constraint(equalToConstant: 80),
            leftDataView.heightAnchor.constraint(equalToConstant: 20),
            leftDataView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: leftDataView.topAnchor),
            timeLabel.leftAnchor.constraint(equalTo: leftDataView.leftAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: leftDataView.bottomAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 40),
            
            statusLabel.topAnchor.constraint(equalTo: leftDataView.topAnchor),
            statusLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 5),
            statusLabel.bottomAnchor.constraint(equalTo: leftDataView.bottomAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: 40),
            
            homeTeamView.leftAnchor.constraint(equalTo: leftDataView.rightAnchor),
            homeTeamView.widthAnchor.constraint(equalToConstant: (HomeViewController.viewFrameWidth - 145) / 2),
            homeTeamView.heightAnchor.constraint(equalToConstant: 20),
            homeTeamView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            homeTeamWins.topAnchor.constraint(equalTo: homeTeamView.topAnchor),
            homeTeamWins.bottomAnchor.constraint(equalTo: homeTeamView.bottomAnchor),
            homeTeamWins.rightAnchor.constraint(equalTo: homeTeamView.rightAnchor),
            homeTeamWins.widthAnchor.constraint(equalToConstant: 10),
            
            homeTeamImageView.topAnchor.constraint(equalTo: homeTeamView.topAnchor),
            homeTeamImageView.bottomAnchor.constraint(equalTo: homeTeamView.bottomAnchor),
            homeTeamImageView.rightAnchor.constraint(equalTo: homeTeamWins.leftAnchor, constant: -8),
            homeTeamImageView.widthAnchor.constraint(equalToConstant: 20),
            
            homeTeam.topAnchor.constraint(equalTo: homeTeamView.topAnchor),
            homeTeam.leftAnchor.constraint(equalTo: homeTeamView.leftAnchor),
            homeTeam.bottomAnchor.constraint(equalTo: homeTeamView.bottomAnchor),
            homeTeam.rightAnchor.constraint(equalTo: homeTeamImageView.leftAnchor, constant: -5),
            
            versusView.leftAnchor.constraint(equalTo: homeTeamView.rightAnchor),
            versusView.widthAnchor.constraint(equalToConstant: 20),
            versusView.heightAnchor.constraint(equalToConstant: 20),
            versusView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            versusLabel.topAnchor.constraint(equalTo: versusView.topAnchor),
            versusLabel.leftAnchor.constraint(equalTo: versusView.leftAnchor),
            versusLabel.bottomAnchor.constraint(equalTo: versusView.bottomAnchor),
            versusLabel.rightAnchor.constraint(equalTo: versusView.rightAnchor),
            
            awayTeamView.leftAnchor.constraint(equalTo: versusView.rightAnchor),
            awayTeamView.widthAnchor.constraint(equalToConstant: (HomeViewController.viewFrameWidth - 145) / 2),
            awayTeamView.heightAnchor.constraint(equalToConstant: 20),
            awayTeamView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            awayTeamWins.topAnchor.constraint(equalTo: awayTeamView.topAnchor),
            awayTeamWins.leftAnchor.constraint(equalTo: awayTeamView.leftAnchor),
            awayTeamWins.bottomAnchor.constraint(equalTo: awayTeamView.bottomAnchor),
            awayTeamWins.widthAnchor.constraint(equalToConstant: 10),
            
            awayTeamImageView.topAnchor.constraint(equalTo: awayTeamView.topAnchor),
            awayTeamImageView.leftAnchor.constraint(equalTo: awayTeamWins.rightAnchor, constant: 8),
            awayTeamImageView.bottomAnchor.constraint(equalTo: awayTeamView.bottomAnchor),
            awayTeamImageView.widthAnchor.constraint(equalToConstant: 20),
            
            awayTeam.topAnchor.constraint(equalTo: awayTeamView.topAnchor),
            awayTeam.leftAnchor.constraint(equalTo: awayTeamImageView.rightAnchor, constant: 5),
            awayTeam.bottomAnchor.constraint(equalTo: awayTeamView.bottomAnchor),
            awayTeam.rightAnchor.constraint(equalTo: awayTeamView.rightAnchor),
        ])
    }   
    
    func update(leagueScheduleInfo: LeagueScheduleTableViewCellModel) {
        timeLabel.text = leagueScheduleInfo.time
        statusLabel.text = MatchStatusType(rawValue: leagueScheduleInfo.status)!.convertKorean()
        statusLabel.textColor = MatchStatusType(rawValue: leagueScheduleInfo.status)!.statusColor()
        statusLabel.layer.borderColor = MatchStatusType(rawValue: leagueScheduleInfo.status)!.statusColor().cgColor
        versusLabel.text = leagueScheduleInfo.versus
        homeTeam.text = leagueScheduleInfo.homeTeam
        setTeamImage(
            teamImageUrl: leagueScheduleInfo.homeTeamImageUrl,
            teamImageView: homeTeamImageView
        )
        homeTeamWins.text = leagueScheduleInfo.status == "not_started" ? "" : String(leagueScheduleInfo.homeTeamWinCount)
        awayTeam.text = leagueScheduleInfo.awayTeam
        setTeamImage(
            teamImageUrl: leagueScheduleInfo.awayTeamImageUrl,
            teamImageView: awayTeamImageView
        )
        awayTeamWins.text = leagueScheduleInfo.status == "not_started" ? "" : String(leagueScheduleInfo.awayTeamWinCount)
        
        if let winnerId = leagueScheduleInfo.winnerId {
            if winnerId == leagueScheduleInfo.homeTeamId {
                homeTeamWins.textColor = .black
                awayTeamWins.textColor = .darkGray
            }
            
            else {
                awayTeamWins.textColor = .black
                homeTeamWins.textColor = .darkGray
            }
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
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
