//
//  ViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let scheduleTableViewModel = ScheduleTableViewModel()
    
    let homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Join Us", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    let homeTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        configureUI()
        scheduleTableViewModel.fetchHTMLData()
    }
    
    func configureUI() {
        view.addSubview(homeButton)
        view.addSubview(homeTableView)
        
        homeTableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        homeTableView.register(TeamTabbarTableViewCell.self, forCellReuseIdentifier: TeamTabbarTableViewCell.identifier)
        homeTableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier)
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeButton.heightAnchor.constraint(equalToConstant: 80),
            
            homeTableView.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10),
            homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
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
            
            return scheduleSectionHeader
        }
        
        else {
            let playerSectionHeader = PlayerSectionHeader()
            
            return playerSectionHeader
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 1 {
            return 250
        }
        
        return 50
    }
}
