//
//  PlayerFrontDataCell.swift
//  JoinUs
//
//  Created by SeungMin on 2022/03/08.
//

import UIKit

class PlayerFrontDataCell: UITableViewCell {
    static let identifier = "PlayerFrontDataCell"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let frontImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        contentView.addSubview(dataContainerView)
        dataContainerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dataContainerView.leftAnchor.constraint(equalTo: categoryLabel.rightAnchor).isActive = true
        dataContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dataContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        dataContainerView.addSubview(dataStackView)
        dataStackView.centerXAnchor.constraint(equalTo: dataContainerView.centerXAnchor).isActive = true
        dataStackView.centerYAnchor.constraint(equalTo: dataContainerView.centerYAnchor).isActive = true
        
        dataStackView.addArrangedSubview(frontImageView)
        frontImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        frontImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dataStackView.addArrangedSubview(descriptionLabel)
    }
    
    func update(category: String, imageString: String, teamColor: UIColor, description: String) {
        categoryLabel.text = category
        categoryLabel.backgroundColor = teamColor
        frontImageView.image = UIImage(named: imageString)
        descriptionLabel.text = description
    }
}
