//
//  NoMonthTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2022/02/14.
//

import UIKit

class NoMonthScheduleCollectionViewCell: UICollectionViewCell {
    static let identifier = "NoMonthScheduleTableViewCell"
    
    let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "이 달은 경기 일정이 없습니다😅"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        contentView.addSubview(noticeLabel)
        noticeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        noticeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
}

