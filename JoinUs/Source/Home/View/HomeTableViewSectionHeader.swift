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
        TitleView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        TitleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        TitleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        TitleView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        TitleView.addSubview(TitleLabel)
        TitleLabel.leftAnchor.constraint(equalTo: TitleView.leftAnchor, constant: 16).isActive = true
        TitleLabel.rightAnchor.constraint(equalTo: TitleView.rightAnchor).isActive = true
        TitleLabel.centerYAnchor.constraint(equalTo: TitleView.centerYAnchor).isActive = true
        TitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func update(homeTableViewSectionType: HomeTableViewSectionType) {
        TitleLabel.text = homeTableViewSectionType.title()
    }
}
