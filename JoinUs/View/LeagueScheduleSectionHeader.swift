//
//  LeagueScheduleSectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/08.
//

import UIKit

final class LeagueScheduleSectionHeader: UIView {
    let leagueView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let leagueImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    let leagueTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(sectionHeaderType: SectionHeaderType) {
        addSubview(leagueView)
        leagueView.addSubview(leagueImage)
        leagueView.addSubview(leagueTitleLabel)
        
        leagueView.translatesAutoresizingMaskIntoConstraints = false
        leagueImage.translatesAutoresizingMaskIntoConstraints = false
        leagueTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leagueView.topAnchor.constraint(equalTo: topAnchor),
            leagueView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leagueView.bottomAnchor.constraint(equalTo: bottomAnchor),
            leagueView.rightAnchor.constraint(equalTo: rightAnchor),
            
            leagueImage.topAnchor.constraint(equalTo: leagueView.topAnchor),
            leagueImage.leftAnchor.constraint(equalTo: leagueView.leftAnchor, constant: 10),
            leagueImage.heightAnchor.constraint(equalToConstant: 20),
            leagueImage.widthAnchor.constraint(equalToConstant: 20),
            
            leagueTitleLabel.topAnchor.constraint(equalTo: leagueView.topAnchor),
            leagueTitleLabel.leftAnchor.constraint(equalTo: leagueImage.rightAnchor, constant: 10),
            leagueTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            leagueTitleLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
        
        leagueImage.image = UIImage(data: sectionHeaderType.image())
        leagueTitleLabel.text = sectionHeaderType.title()
    }
}
