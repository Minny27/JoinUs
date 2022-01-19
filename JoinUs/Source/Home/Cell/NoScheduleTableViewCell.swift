//
//  NoScheduleTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2022/01/17.
//

import UIKit

class NoScheduleTableViewCell: UITableViewCell {
    static let identifier = "noScheduleTableViewCell"
    
    let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘은 경기 일정이 없습니다😅"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    func configureCell() {
        contentView.addSubview(noticeLabel)
        
        noticeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noticeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            noticeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
