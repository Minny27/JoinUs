//
//  ScheduleSectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/19.
//

import UIKit

final class HomeTableViewSectionHeader: UIView {
    let TitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let TitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupSectionHeader() {
        backgroundColor = .systemGray6
        
        addSubview(TitleView)
        TitleView.addSubview(TitleLabel)
        
        NSLayoutConstraint.activate([
            TitleView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            TitleView.leftAnchor.constraint(equalTo: leftAnchor),
            TitleView.rightAnchor.constraint(equalTo: rightAnchor),
            TitleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            TitleLabel.leftAnchor.constraint(equalTo: TitleView.leftAnchor, constant: 16),
            TitleLabel.rightAnchor.constraint(equalTo: TitleView.rightAnchor),
            TitleLabel.centerYAnchor.constraint(equalTo: TitleView.centerYAnchor),
            TitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func update(homeTableViewSectionType: HomeTableViewSectionType) {
        TitleLabel.text = homeTableViewSectionType.title()
    }
}
