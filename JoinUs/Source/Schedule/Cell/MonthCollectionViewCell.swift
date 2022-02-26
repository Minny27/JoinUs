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
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            monthLabel.textColor = isHighlighted ? .purple : .black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            monthLabel.textColor = isSelected ? .purple : .black
        }
    }
    
    func setupCell() {
        contentView.addSubview(monthLabel)
        
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            monthLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            monthLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            monthLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    func update(monthInfo: Month) {
        monthLabel.text = String(Int(monthInfo.month.replacingOccurrences(of: "월", with: ""))!) + "월"
    }
}
