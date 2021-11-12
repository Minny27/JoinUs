//
//  ScheduleSectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/19.
//

import UIKit

final class ScheduleSectionHeader: UIView {
    let scheduleTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    let scheduleTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
       
        return label
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(sectionHeaderType: ScheduleSectionHeaderType) {
        addSubview(scheduleTitleView)
        scheduleTitleView.addSubview(scheduleTitleLabel)
        
        scheduleTitleView.translatesAutoresizingMaskIntoConstraints = false
        scheduleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scheduleTitleView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            scheduleTitleView.leftAnchor.constraint(equalTo: leftAnchor),
            scheduleTitleView.rightAnchor.constraint(equalTo: rightAnchor),
            scheduleTitleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scheduleTitleLabel.leftAnchor.constraint(equalTo: scheduleTitleView.leftAnchor, constant: 10),
            scheduleTitleLabel.rightAnchor.constraint(equalTo: scheduleTitleView.rightAnchor),
            scheduleTitleLabel.centerYAnchor.constraint(equalTo: scheduleTitleView.centerYAnchor),
            scheduleTitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        scheduleTitleLabel.text = sectionHeaderType.title()
    }
}
