//
//  ScheduleSectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/19.
//

import UIKit

class ScheduleSectionHeader: UIView {
    
    let scheduleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ Today's Match"
        label.font = .boldSystemFont(ofSize: 15)
       
        return label
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(scheduleTitleLabel)
        
        scheduleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scheduleTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            scheduleTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            scheduleTitleLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
