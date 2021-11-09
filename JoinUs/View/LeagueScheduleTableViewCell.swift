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
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.layer.borderWidth = 0.3
        label.layer.cornerRadius = 5
        
        return label
    }()
    
    let tournamentNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        
        return label
    }()
    
    let homeTeamView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let homeTeam: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .right
        
        return label
    }()
    
    let homeTeamImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let homeTeamWins: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .right
        
        return label
    }()
    
    let versusView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let versusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        
        return label
    }()
    
    let awayTeamView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let awayTeam: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        
        return label
    }()
    
    let awayTeamImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let awayTeamWins: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
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
        contentView.addSubview(leftDataView)
        contentView.addSubview(homeTeamView)
        contentView.addSubview(versusView)
        contentView.addSubview(awayTeamView)
        leftDataView.addSubview(timeLabel)
        leftDataView.addSubview(statusLabel)
        leftDataView.addSubview(tournamentNameLabel)
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
        tournamentNameLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTeam.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImage.translatesAutoresizingMaskIntoConstraints = false
        homeTeamWins.translatesAutoresizingMaskIntoConstraints = false
        versusView.translatesAutoresizingMaskIntoConstraints = false
        versusLabel.translatesAutoresizingMaskIntoConstraints = false
        awayTeam.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImage.translatesAutoresizingMaskIntoConstraints = false
        awayTeamWins.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftDataView.topAnchor.constraint(equalTo: contentView .topAnchor, constant: 10),
            leftDataView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leftDataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leftDataView.widthAnchor.constraint(equalToConstant: 175),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLabel.leftAnchor.constraint(equalTo: leftDataView.leftAnchor, constant: 20),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 30),
            
            statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            statusLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 2),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: 30),
            
            tournamentNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tournamentNameLabel.leftAnchor.constraint(equalTo: statusLabel.rightAnchor, constant: 13),
            tournamentNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tournamentNameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            homeTeamView.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeamView.leftAnchor.constraint(equalTo: leftDataView.rightAnchor),
            homeTeamView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeamView.widthAnchor.constraint(equalToConstant: 90),
            
            homeTeamWins.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeamWins.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeamWins.rightAnchor.constraint(equalTo: homeTeamView.rightAnchor),
            homeTeamWins.widthAnchor.constraint(equalToConstant: 10),
            
            homeTeamImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeamImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeamImage.rightAnchor.constraint(equalTo: homeTeamWins.leftAnchor, constant: -8),
            homeTeamImage.widthAnchor.constraint(equalToConstant: 15),
            homeTeamImage.heightAnchor.constraint(equalToConstant: 15),
            
            homeTeam.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeam.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeam.rightAnchor.constraint(equalTo: homeTeamImage.leftAnchor, constant: -2),
            homeTeam.widthAnchor.constraint(equalToConstant: 55),
            
            versusView.topAnchor.constraint(equalTo: contentView.topAnchor),
            versusView.leftAnchor.constraint(equalTo: homeTeamView.rightAnchor),
            versusView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            versusView.widthAnchor.constraint(equalToConstant: 20),
            
            versusLabel.topAnchor.constraint(equalTo: versusView.topAnchor),
            versusLabel.leftAnchor.constraint(equalTo: versusView.leftAnchor),
            versusLabel.bottomAnchor.constraint(equalTo: versusView.bottomAnchor),
            versusLabel.rightAnchor.constraint(equalTo: versusView.rightAnchor),
            
            awayTeamView.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeamView.leftAnchor.constraint(equalTo: versusView.rightAnchor),
            awayTeamView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeamView.widthAnchor.constraint(equalToConstant: 90),
            
            awayTeamWins.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeamWins.leftAnchor.constraint(equalTo: awayTeamView.leftAnchor),
            awayTeamWins.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeamWins.widthAnchor.constraint(equalToConstant: 10),
            
            awayTeamImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeamImage.leftAnchor.constraint(equalTo: awayTeamWins.rightAnchor, constant: 8),
            awayTeamImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeamImage.widthAnchor.constraint(equalToConstant: 15),
            awayTeamImage.heightAnchor.constraint(equalToConstant: 15),
            
            awayTeam.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeam.leftAnchor.constraint(equalTo: awayTeamImage.rightAnchor, constant: 2),
            awayTeam.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeam.widthAnchor.constraint(equalToConstant: 55),
        ])
    }   
    
    func update(scheduleTableViewCellModel: ScheduleTableViewCellModel) {
        timeLabel.text = scheduleTableViewCellModel.time
        statusLabel.text = MatchStatusType(rawValue: scheduleTableViewCellModel.status)!.convertKorean()
        statusLabel.textColor = MatchStatusType(rawValue: scheduleTableViewCellModel.status)!.statusColor()
        statusLabel.layer.borderColor = MatchStatusType(rawValue: scheduleTableViewCellModel.status)!.statusColor().cgColor
        tournamentNameLabel.text = scheduleTableViewCellModel.tournamentName
        versusLabel.text = scheduleTableViewCellModel.versus
        homeTeam.text = scheduleTableViewCellModel.homeTeam
        homeTeamImage.image = UIImage(data: scheduleTableViewCellModel.homeTeamImage)
        homeTeamWins.text = scheduleTableViewCellModel.status == "not_started" ? "" : String(scheduleTableViewCellModel.homeTeamWinCount)
        awayTeam.text = scheduleTableViewCellModel.awayTeam
        awayTeamImage.image = UIImage(data: scheduleTableViewCellModel.awayTeamImage)
        awayTeamWins.text = scheduleTableViewCellModel.status == "not_started" ? "" : String(scheduleTableViewCellModel.awayTeamWinCount)
        
        if let winnerId = scheduleTableViewCellModel.winnerId {
            if winnerId == scheduleTableViewCellModel.homeTeamId {
                homeTeamWins.font = .boldSystemFont(ofSize: 10)
                awayTeamWins.textColor = .darkGray
            }
            
            else {
                awayTeamWins.font = .boldSystemFont(ofSize: 10)
                homeTeamWins.textColor = .darkGray
            }
        }
    }
}
