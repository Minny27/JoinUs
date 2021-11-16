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
        label.textColor = .black
        label.textAlignment = .center
        
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
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        view.backgroundColor = .white
        
        configureUI()
    }
    
    func configureUI() {
        HomeViewController.viewFrameWidth = view.frame.width
        
        view.addSubview(homeLabel)
        view.addSubview(homeTableView)
        
        homeTableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        homeTableView.register(TeamTabbarTableViewCell.self, forCellReuseIdentifier: TeamTabbarTableViewCell.identifier)
        homeTableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier)
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeLabel.topAnchor.constraint(equalTo: view.topAnchor),
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configureCell()
            
            return cell
        }
        
        else {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamTabbarTableViewCell.identifier, for: indexPath) as? TeamTabbarTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.configureCell()
                
                return cell
            }
            
            else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as? PlayerTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.configureCell()
                
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let scheduleSectionHeader = ScheduleSectionHeader()
            scheduleSectionHeader.configureUI(sectionHeaderType: .schedule)
            
            return scheduleSectionHeader
        }
        
        else {
            let playerSectionHeader = ScheduleSectionHeader()
            playerSectionHeader.configureUI(sectionHeaderType: .player)
            
            return playerSectionHeader
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 50
            }
//            else {
//                return 250
//            }
        }

        return 250
    }
}
