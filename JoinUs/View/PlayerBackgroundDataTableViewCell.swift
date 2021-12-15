//
//  PlayerBackgroundDataTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/14.
//

import UIKit

class PlayerBackgroundDataTableViewCell: UITableViewCell {
    static let identifier = "playerBackgroundDataTableViewCell"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }

    func configureCell() {
        contentView.addSubview(categoryLabel)
        contentView.addSubview(contentLabel)
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 2 / 10),
            
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentLabel.leftAnchor.constraint(equalTo: categoryLabel.rightAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
}
