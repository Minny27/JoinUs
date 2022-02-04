//
//  ViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    static var viewFrameWidth: CGFloat = 0
    
    let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "Join Us"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    var homeTableView: UITableView = {
        let tableView = UITableView()

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        
        return tableView
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
     
    func configureUI() {
        HomeViewController.viewFrameWidth = view.frame.width
        
        view.backgroundColor = .white
        view.addSubview(homeLabel)
        view.addSubview(homeTableView)
        
        homeTableView.separatorStyle = .none
        
        homeTableView.register(
            ScheduleTableViewCell.self,
            forCellReuseIdentifier: ScheduleTableViewCell.identifier
        )
        homeTableView.register(
            TeamTabbarTableViewCell.self,
            forCellReuseIdentifier: TeamTabbarTableViewCell.identifier
        )
        homeTableView.register(
            TeamPlayerTableViewCell.self,
            forCellReuseIdentifier: TeamPlayerTableViewCell.identifier
        )
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeLabel.heightAnchor.constraint(equalToConstant: 80),
            
            homeTableView.topAnchor.constraint(equalTo: homeLabel.bottomAnchor),
            homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        else {
            return 2
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let homeTableViewSectionType = HomeTableViewSectionType(rawValue: indexPath.section)!
        
        switch homeTableViewSectionType {
        case .schedule:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ScheduleTableViewCell.identifier,
                for: indexPath
            ) as? ScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configureCell()
            
            return cell
            
        case .player:
            let cellType = HomeTableViewSectionType.cellType(rawValue: indexPath.row)!
            
            switch cellType {
            case .team:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TeamTabbarTableViewCell.identifier,
                    for: indexPath
                ) as? TeamTabbarTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.configureCell()
                
                return cell
                
            case .players:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TeamPlayerTableViewCell.identifier,
                    for: indexPath
                ) as? TeamPlayerTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.configureCell()
                
                return cell
            }
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let homeTableViewSectionType = HomeTableViewSectionType(rawValue: section)!
        
        switch homeTableViewSectionType {
        case .schedule:
            let scheduleSectionHeader = HomeTableViewSectionHeader()
            scheduleSectionHeader.configureUI()
            scheduleSectionHeader.update(homeTableViewSectionType: .schedule)
            
            return scheduleSectionHeader
        case .player:
            let playerSectionHeader = HomeTableViewSectionHeader()
            playerSectionHeader.configureUI()
            playerSectionHeader.update(homeTableViewSectionType: .player)
            
            return playerSectionHeader
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 40
            }
            else {
                return 240
            }
        }

        return 250
    }
}
