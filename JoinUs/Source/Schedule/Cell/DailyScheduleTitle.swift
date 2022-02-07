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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configureCell() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func update(schedule: LeagueScheduleTableViewCellModel) {
        titleLabel.text = schedule.date.replacingOccurrences(of: "-", with: "월") + "일"
    }
}
