//
//  MonthCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/14.
//

import UIKit

final class MonthCollectionViewCell: UICollectionViewCell {
    static let identifier = "monthCollectionViewCell"
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.borderWidth = 0.3
        label.layer.cornerRadius = 10
        
        return label
    }()
    
    func configureCell() {
        contentView.addSubview(monthLabel)
        
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            monthLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            monthLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            monthLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    func update(monthInfo: Month) {
        monthLabel.text = monthInfo.month
    }
}
