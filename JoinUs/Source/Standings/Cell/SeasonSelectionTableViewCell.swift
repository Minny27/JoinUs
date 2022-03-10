//
//  SeasonCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/30.
//

import UIKit

final class SeasonSelectionTableViewCell: UITableViewCell {
    static let identifier = "SeasonSelectionTableViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let seasonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seasonLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                yearLabel.textColor = .systemBlue
                seasonLabel.textColor = .systemBlue
                containerView.layer.borderColor = UIColor.systemBlue.cgColor
            }
            
            else {
                yearLabel.textColor = .lightGray
                seasonLabel.textColor = .lightGray
                containerView.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                yearLabel.textColor = .systemBlue
                seasonLabel.textColor = .systemBlue
                containerView.layer.borderColor = UIColor.systemBlue.cgColor
            }
            
            else {
                yearLabel.textColor = .lightGray
                seasonLabel.textColor = .lightGray
                containerView.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    func setupCell() {
        contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        containerView.addSubview(seasonStackView)
        seasonStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        seasonStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        seasonStackView.addArrangedSubview(yearLabel)
        seasonStackView.addArrangedSubview(seasonLabel)
    }
    
    func update(year: String, season: String) {
        yearLabel.text = year
        seasonLabel.text = season
    }
}
