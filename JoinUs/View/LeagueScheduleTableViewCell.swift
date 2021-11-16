//
//  LeagueTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/05.
//

import UIKit

class LeagueScheduleTableViewCell: UITableViewCell {
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
    
    let homeTeamImage: UIImageView = {
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
    
    let awayTeamImage: UIImageView = {
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
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureUI() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(leftDataView)
        contentView.addSubview(homeTeamView)
        contentView.addSubview(versusView)
        contentView.addSubview(awayTeamView)
        leftDataView.addSubview(timeLabel)
        leftDataView.addSubview(statusLabel)
        homeTeamView.addSubview(homeTeam)
        homeTeamView.addSubview(homeTeamImage)
        homeTeamView.addSubview(homeTeamWins)
        versusView.addSubview(versusLabel)
        awayTeamView.addSubview(awayTeam)
        awayTeamView.addSubview(awayTeamImage)
        awayTeamView.addSubview(awayTeamWins)
        
        leftDataView.translatesAutoresizingMaskIntoConstraints = false
        homeTeamView.translatesAutoresizingMaskIntoConstraints = false
        awayTeamView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTeam.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImage.translatesAutoresizingMaskIntoConstraints = false
        homeTeamWins.translatesAutoresizingMaskIntoConstraints = false
        versusView.translatesAutoresizingMaskIntoConstraints = false
        versusLabel.translatesAutoresizingMaskIntoConstraints = false
        awayTeam.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImage.translatesAutoresizingMaskIntoConstraints = false
        awayTeamWins.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftDataView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
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
            
            homeTeamImage.topAnchor.constraint(equalTo: homeTeamView.topAnchor),
            homeTeamImage.bottomAnchor.constraint(equalTo: homeTeamView.bottomAnchor),
            homeTeamImage.rightAnchor.constraint(equalTo: homeTeamWins.leftAnchor, constant: -8),
            homeTeamImage.widthAnchor.constraint(equalToConstant: 20),
            
            homeTeam.topAnchor.constraint(equalTo: homeTeamView.topAnchor),
            homeTeam.leftAnchor.constraint(equalTo: homeTeamView.leftAnchor),
            homeTeam.bottomAnchor.constraint(equalTo: homeTeamView.bottomAnchor),
            homeTeam.rightAnchor.constraint(equalTo: homeTeamImage.leftAnchor, constant: -5),
            
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
            
            awayTeamImage.topAnchor.constraint(equalTo: awayTeamView.topAnchor),
            awayTeamImage.leftAnchor.constraint(equalTo: awayTeamWins.rightAnchor, constant: 8),
            awayTeamImage.bottomAnchor.constraint(equalTo: awayTeamView.bottomAnchor),
            awayTeamImage.widthAnchor.constraint(equalToConstant: 20),
            
            awayTeam.topAnchor.constraint(equalTo: awayTeamView.topAnchor),
            awayTeam.leftAnchor.constraint(equalTo: awayTeamImage.rightAnchor, constant: 5),
            awayTeam.bottomAnchor.constraint(equalTo: awayTeamView.bottomAnchor),
            awayTeam.rightAnchor.constraint(equalTo: awayTeamView.rightAnchor),
        ])
    }   
    
    func update(scheduleTableViewCellModel: ScheduleTableViewCellModel) {
        timeLabel.text = scheduleTableViewCellModel.time
        statusLabel.text = MatchStatusType(rawValue: scheduleTableViewCellModel.status)!.convertKorean()
        statusLabel.textColor = MatchStatusType(rawValue: scheduleTableViewCellModel.status)!.statusColor()
        statusLabel.layer.borderColor = MatchStatusType(rawValue: scheduleTableViewCellModel.status)!.statusColor().cgColor
        versusLabel.text = scheduleTableViewCellModel.versus
        homeTeam.text = scheduleTableViewCellModel.homeTeam
        homeTeamImage.image = UIImage(data: scheduleTableViewCellModel.homeTeamImage)
        homeTeamWins.text = scheduleTableViewCellModel.status == "not_started" ? "" : String(scheduleTableViewCellModel.homeTeamWinCount)
        awayTeam.text = scheduleTableViewCellModel.awayTeam
        awayTeamImage.image = UIImage(data: scheduleTableViewCellModel.awayTeamImage)
        awayTeamWins.text = scheduleTableViewCellModel.status == "not_started" ? "" : String(scheduleTableViewCellModel.awayTeamWinCount)
        
        if let winnerId = scheduleTableViewCellModel.winnerId {
            if winnerId == scheduleTableViewCellModel.homeTeamId {
                homeTeamWins.textColor = .black
                awayTeamWins.textColor = .darkGray
            }
            
            else {
                awayTeamWins.textColor = .black
                homeTeamWins.textColor = .darkGray
            }
        }
    }
}
