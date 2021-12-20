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
        
        return view
    }()
    
    let TitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
       
        return label
    }()
    
    func configureUI(homeTableViewSectionType: HomeTableViewSectionType) {
        backgroundColor = .systemGray6
        
        addSubview(TitleView)
        TitleView.addSubview(TitleLabel)
        
        TitleView.translatesAutoresizingMaskIntoConstraints = false
        TitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            TitleView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            TitleView.leftAnchor.constraint(equalTo: leftAnchor),
            TitleView.rightAnchor.constraint(equalTo: rightAnchor),
            TitleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            TitleLabel.leftAnchor.constraint(equalTo: TitleView.leftAnchor, constant: 10),
            TitleLabel.rightAnchor.constraint(equalTo: TitleView.rightAnchor),
            TitleLabel.centerYAnchor.constraint(equalTo: TitleView.centerYAnchor),
            TitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        TitleLabel.text = homeTableViewSectionType.title()
    }
}
