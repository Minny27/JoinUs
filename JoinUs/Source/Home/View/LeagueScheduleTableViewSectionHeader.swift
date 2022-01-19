//
//  LeagueScheduleSectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/08.
//

import UIKit

final class LeagueScheduleTableViewSectionHeader: UIView {
    let leagueView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    let leagueDataView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let leagueImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let leagueTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    func configureUI(leagueScheduleTableViewSectionType: LeagueScheduleTableViewSectionType) {
        backgroundColor = .systemGray6
        
        addSubview(leagueView)
        leagueView.addSubview(leagueDataView)
        leagueDataView.addSubview(leagueImageView)
        leagueDataView.addSubview(leagueTitleLabel)
        
        leagueView.translatesAutoresizingMaskIntoConstraints = false
        leagueDataView.translatesAutoresizingMaskIntoConstraints = false
        leagueImageView.translatesAutoresizingMaskIntoConstraints = false
        leagueTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leagueView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            leagueView.leftAnchor.constraint(equalTo: leftAnchor),
            leagueView.bottomAnchor.constraint(equalTo: bottomAnchor),
            leagueView.rightAnchor.constraint(equalTo: rightAnchor),
            
            leagueDataView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            leagueDataView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            leagueDataView.centerYAnchor.constraint(equalTo: leagueView.centerYAnchor),
            leagueDataView.heightAnchor.constraint(equalToConstant: 20),
            
            leagueImageView.topAnchor.constraint(equalTo: leagueDataView.topAnchor),
            leagueImageView.leftAnchor.constraint(equalTo: leagueDataView.leftAnchor),
            leagueImageView.bottomAnchor.constraint(equalTo: leagueDataView.bottomAnchor),
            leagueImageView.widthAnchor.constraint(equalToConstant: 20),
            
            leagueTitleLabel.topAnchor.constraint(equalTo: leagueDataView.topAnchor),
            leagueTitleLabel.leftAnchor.constraint(equalTo: leagueImageView.rightAnchor, constant: 5),
            leagueTitleLabel.bottomAnchor.constraint(equalTo: leagueDataView.bottomAnchor),
            leagueTitleLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        leagueImageView.image = UIImage(data: leagueScheduleTableViewSectionType.image())
        leagueTitleLabel.text = leagueScheduleTableViewSectionType.title()
    }
}
