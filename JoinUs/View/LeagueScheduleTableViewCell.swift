//
//  LeagueTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/05.
//

import UIKit

class LeagueScheduleTableViewCell: UITableViewCell {
    static let identifier = "LeagueTableViewCell"
    
    let leftDataView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 9)
        
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 9)
        
        return label
    }()
    
    let tournamentNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 9)
        
        return label
    }()
    
    let homeTeamView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let homeTeam: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let homeTeamImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let homeTeamWins: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let versusView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let versusLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let awayTeamView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let awayTeam: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let awayTeamImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let awayTeamWins: UILabel = {
        let label = UILabel()
        
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
            leftDataView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leftDataView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leftDataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leftDataView.widthAnchor.constraint(equalToConstant: 107),
            
            timeLabel.topAnchor.constraint(equalTo: leftDataView.topAnchor),
            timeLabel.leftAnchor.constraint(equalTo: leftDataView.leftAnchor, constant: 10),
            timeLabel.bottomAnchor.constraint(equalTo: leftDataView.bottomAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 30),
            
            statusLabel.topAnchor.constraint(equalTo: leftDataView.topAnchor),
            statusLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 2),
            statusLabel.bottomAnchor.constraint(equalTo: leftDataView.bottomAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: 20),
            
            tournamentNameLabel.topAnchor.constraint(equalTo: leftDataView.topAnchor),
            tournamentNameLabel.leftAnchor.constraint(equalTo: statusLabel.rightAnchor, constant: 5),
            tournamentNameLabel.bottomAnchor.constraint(equalTo: leftDataView.bottomAnchor),
            tournamentNameLabel.widthAnchor.constraint(equalToConstant: 50),
            
            homeTeamView.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeamView.leftAnchor.constraint(equalTo: leftDataView.rightAnchor),
            homeTeamView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeamView.widthAnchor.constraint(equalToConstant: 107),
            
            homeTeamWins.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeamWins.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeamWins.rightAnchor.constraint(equalTo: homeTeamView.rightAnchor),
            homeTeamWins.widthAnchor.constraint(equalToConstant: 10),
            
            homeTeamImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeamImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeamImage.rightAnchor.constraint(equalTo: homeTeamWins.leftAnchor, constant: 5),
            homeTeamImage.widthAnchor.constraint(equalToConstant: 20),
            
            homeTeam.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeTeam.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeam.rightAnchor.constraint(equalTo: homeTeamView.leftAnchor, constant: 2),
            homeTeam.widthAnchor.constraint(equalToConstant: 70),
            
            versusView.topAnchor.constraint(equalTo: contentView.topAnchor),
            versusView.leftAnchor.constraint(equalTo: homeTeamView.leftAnchor),
            versusView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            versusView.widthAnchor.constraint(equalToConstant: 20),
            
            versusLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            versusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            versusLabel.centerXAnchor.constraint(equalTo: versusView.centerXAnchor),
            versusLabel.widthAnchor.constraint(equalToConstant: 10),
            
            awayTeamView.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeamView.leftAnchor.constraint(equalTo: versusView.rightAnchor),
            awayTeamView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeamView.widthAnchor.constraint(equalToConstant: 107),
            
            awayTeamWins.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeamWins.leftAnchor.constraint(equalTo: awayTeamView.leftAnchor),
            awayTeamWins.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeamWins.widthAnchor.constraint(equalToConstant: 10),
            
            awayTeamImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeamImage.leftAnchor.constraint(equalTo: awayTeamWins.rightAnchor, constant: 5),
            awayTeamImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeamImage.widthAnchor.constraint(equalToConstant: 20),
            
            awayTeam.topAnchor.constraint(equalTo: contentView.topAnchor),
            awayTeam.leftAnchor.constraint(equalTo: awayTeamImage.rightAnchor, constant: 2),
            awayTeam.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeam.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    func update(scheduleTableViewCellModel: ScheduleTableViewCellModel) {
        timeLabel.text = scheduleTableViewCellModel.time
        statusLabel.text = scheduleTableViewCellModel.status
        tournamentNameLabel.text = scheduleTableViewCellModel.tournamentName
        versusLabel.text = scheduleTableViewCellModel.versus
        homeTeam.text = scheduleTableViewCellModel.homeTeam
        homeTeamImage.image = UIImage(named: scheduleTableViewCellModel.homeTeamImage)
        homeTeamWins.text = scheduleTableViewCellModel.status == "not_started" ? "" : String(scheduleTableViewCellModel.homeTeamWinCount)
        awayTeam.text = scheduleTableViewCellModel.awayTeam
        awayTeamImage.image = UIImage(named: scheduleTableViewCellModel.awayTeamImage)
        awayTeamWins.text = scheduleTableViewCellModel.status == "not_started" ? "" : String(scheduleTableViewCellModel.awayTeamWinCount)
    }
}
