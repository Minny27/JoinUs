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
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
        ])
    }

    func update(schedule: LeagueScheduleTableViewCellModel) {
        titleLabel.text = schedule.date.replacingOccurrences(of: "-", with: "월 ") + "일"
    }
}
