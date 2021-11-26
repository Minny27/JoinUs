//
//  CategoryTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/26.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    static let identifier = "categoryTableViewCell"
    
    let categoryDataView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let rankingLabel: UILabel = {
        let label = UILabel()
        label.text = "R"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "Team"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        
        return label
    }()
    
    let winsLabel: UILabel = {
        let label = UILabel()
        label.text = "W"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let losesLabel: UILabel = {
        let label = UILabel()
        label.text = "L"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let winRateLabel: UILabel = {
        let label = UILabel()
        label.text = "W%"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let pointLabel: UILabel = {
        let label = UILabel()
        label.text = "P"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    func configureCell() {
        contentView.addSubview(categoryDataView)
        categoryDataView.addSubview(rankingLabel)
        categoryDataView.addSubview(teamLabel)
        categoryDataView.addSubview(winsLabel)
        categoryDataView.addSubview(losesLabel)
        categoryDataView.addSubview(winRateLabel)
        categoryDataView.addSubview(pointLabel)
        
        categoryDataView.translatesAutoresizingMaskIntoConstraints = false
        rankingLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        winsLabel.translatesAutoresizingMaskIntoConstraints = false
        losesLabel.translatesAutoresizingMaskIntoConstraints = false
        winRateLabel.translatesAutoresizingMaskIntoConstraints = false
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryDataView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            categoryDataView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            categoryDataView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryDataView.heightAnchor.constraint(equalToConstant: 30),
            
            rankingLabel.topAnchor.constraint(equalTo: categoryDataView.topAnchor),
            rankingLabel.leftAnchor.constraint(equalTo: categoryDataView.leftAnchor),
            rankingLabel.bottomAnchor.constraint(equalTo: categoryDataView.bottomAnchor),
            rankingLabel.widthAnchor.constraint(equalToConstant: 25),
            
            teamLabel.topAnchor.constraint(equalTo: categoryDataView.topAnchor),
            teamLabel.leftAnchor.constraint(equalTo: rankingLabel.rightAnchor, constant: 5),
            teamLabel.bottomAnchor.constraint(equalTo: categoryDataView.bottomAnchor),
            teamLabel.widthAnchor.constraint(equalToConstant: 135),
            
            winsLabel.topAnchor.constraint(equalTo: categoryDataView.topAnchor),
            winsLabel.leftAnchor.constraint(equalTo: teamLabel.rightAnchor),
            winsLabel.bottomAnchor.constraint(equalTo: categoryDataView.bottomAnchor),
            winsLabel.widthAnchor.constraint(equalToConstant: 25),
            
            losesLabel.topAnchor.constraint(equalTo: categoryDataView.topAnchor),
            losesLabel.leftAnchor.constraint(equalTo: winsLabel.rightAnchor),
            losesLabel.bottomAnchor.constraint(equalTo: categoryDataView.bottomAnchor),
            losesLabel.widthAnchor.constraint(equalToConstant: 25),
            
            winRateLabel.topAnchor.constraint(equalTo: categoryDataView.topAnchor),
            winRateLabel.leftAnchor.constraint(equalTo: losesLabel.rightAnchor),
            winRateLabel.bottomAnchor.constraint(equalTo: categoryDataView.bottomAnchor),
            winRateLabel.widthAnchor.constraint(equalToConstant: 50),
            
            pointLabel.topAnchor.constraint(equalTo: categoryDataView.topAnchor),
            pointLabel.leftAnchor.constraint(equalTo: winRateLabel.rightAnchor),
            pointLabel.bottomAnchor.constraint(equalTo: categoryDataView.bottomAnchor),
            pointLabel.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
}
