//
//  DailyScheduleTitle.swift
//  JoinUs
//
//  Created by SeungMin on 2022/02/06.
//

import UIKit

class DailyScheduleTitle: UITableViewCell {
    static let identifier = "DailyScheduleTitle"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configureCell() {
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12).isActive = true
    }

    func update(leagueScheduleInfo: LeagueScheduleTableViewCellModel) {
        titleLabel.text = leagueScheduleInfo.date.replacingOccurrences(of: "-", with: "월 ") + "일"
        let todayDate = DateFormatter().dateToString(date: Date(), dateFormat: .date)
        if leagueScheduleInfo.date == todayDate {
            contentView.layer.borderWidth = 2
            contentView.layer.borderColor = UIColor.purple.cgColor
        }
    }
}
