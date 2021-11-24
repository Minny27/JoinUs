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
    
    let leagueImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    let leagueTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(leagueScheduleTableViewSectionType: LeagueScheduleTableViewSectionType) {
        backgroundColor = .systemGray6
        
        addSubview(leagueView)
        leagueView.addSubview(leagueDataView)
        leagueDataView.addSubview(leagueImage)
        leagueDataView.addSubview(leagueTitleLabel)
        
        leagueView.translatesAutoresizingMaskIntoConstraints = false
        leagueDataView.translatesAutoresizingMaskIntoConstraints = false
        leagueImage.translatesAutoresizingMaskIntoConstraints = false
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
            
            leagueImage.topAnchor.constraint(equalTo: leagueDataView.topAnchor),
            leagueImage.leftAnchor.constraint(equalTo: leagueDataView.leftAnchor),
            leagueImage.bottomAnchor.constraint(equalTo: leagueDataView.bottomAnchor),
            leagueImage.widthAnchor.constraint(equalToConstant: 20),
            
            leagueTitleLabel.topAnchor.constraint(equalTo: leagueDataView.topAnchor),
            leagueTitleLabel.leftAnchor.constraint(equalTo: leagueImage.rightAnchor, constant: 5),
            leagueTitleLabel.bottomAnchor.constraint(equalTo: leagueDataView.bottomAnchor),
            leagueTitleLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        leagueImage.image = UIImage(data: leagueScheduleTableViewSectionType.image())
        leagueTitleLabel.text = leagueScheduleTableViewSectionType.title()
    }
}
