//
//  PlayerBackgroundDataTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/14.
//

import UIKit

final class PlayerDetailCell: UITableViewCell {
    static let identifier = "PlayerDetailCell"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        contentView.addSubview(categoryLabel)
        categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 2 / 10).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: categoryLabel.rightAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    func update(category: String, description: String, teamColor: UIColor) {
        categoryLabel.text = category
        categoryLabel.backgroundColor = teamColor
        descriptionLabel.text = description + getPlayerAge(age: description)
    }
    
    func getPlayerAge(age: String) -> String {
        let thisYear = Calendar.current.component(.year, from: Date())
        let thisMonth = Calendar.current.component(.month, from: Date())
        let thisDay = Calendar.current.component(.day, from: Date())
        
        let ageSplit = age.components(separatedBy: " ")
        guard let playerYear = getStringRemoveLast(value: ageSplit[0]) else { return ""}
        guard let playerMonth = getStringRemoveLast(value: ageSplit[1]) else { return ""}
        guard let playerDay = getStringRemoveLast(value: ageSplit[2]) else { return ""}
        
        var resultAge = thisYear - playerYear - 1
        if thisMonth > playerMonth || thisMonth == playerMonth && thisDay >= playerDay {
            resultAge += 1
        }
        return "(만 \(resultAge)세)"
    }
    
    func getStringRemoveLast(value: String) -> Int? {
        let startIndex = value.index(value.startIndex, offsetBy: 0)
        let endIndex = value.index(before: value.endIndex)
        let intValue = Int(value[startIndex..<endIndex])
        return intValue
    }
}
