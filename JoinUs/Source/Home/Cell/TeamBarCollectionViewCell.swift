//
//  teamTabbarCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import UIKit

final class TeamBarCollectionViewCell: UICollectionViewCell {
    static let identifier = "TeamBarCollectionViewCell"
    
    let teamStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
       
    override var isHighlighted: Bool {
        didSet {
            teamLabel.textColor = isHighlighted ? .purple : .black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            teamLabel.textColor = isSelected ? .purple : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(teamStackView)
        teamStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        teamStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        teamStackView.addArrangedSubview(teamImageView)
        teamImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        teamImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        teamStackView.addArrangedSubview(teamLabel)
    }
    
    func update(teamInfo: Team) {
        teamLabel.text = teamInfo.team
        teamImageView.image = UIImage(named: teamInfo.imageString)
    }
}
