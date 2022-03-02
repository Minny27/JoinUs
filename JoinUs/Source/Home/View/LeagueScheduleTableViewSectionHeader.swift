//
//  LeagueScheduleSectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/08.
//

import Kingfisher
import UIKit

final class LeagueScheduleTableViewSectionHeader: UIView {
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let leagueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let leagueTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configureUI() {
        backgroundColor = .systemGray6
        
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(leagueImageView)
        containerStackView.addArrangedSubview(leagueTitleLabel)
        
        NSLayoutConstraint.activate([
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            leagueImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            leagueImageView.widthAnchor.constraint(equalToConstant: 20),
            leagueImageView.heightAnchor.constraint(equalToConstant: 20),

        ])
    }
    
    func update(leagueScheduleTableViewSectionType: LeagueScheduleTableViewSectionType) {
        setLeagueImage(
            leagueImageUrl: leagueScheduleTableViewSectionType.imageUrl(),
            leagueImageView: leagueImageView
        )
        leagueTitleLabel.text = leagueScheduleTableViewSectionType.title()
    }
    
    func setLeagueImage(leagueImageUrl: URL, leagueImageView: UIImageView) {
        let processor = DownsamplingImageProcessor(size: CGSize(width: 20, height: 20))
        leagueImageView.kf.indicatorType = .activity
        leagueImageView.kf.setImage(
            with: leagueImageUrl,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
//        {
//            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
//        }
    }
}
