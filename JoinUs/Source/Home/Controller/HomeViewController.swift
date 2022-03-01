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
        tableView.separatorStyle = .none
        tableView.allowsSelection = false

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
            TeamPlayerPagerView.self,
            forCellReuseIdentifier: TeamPlayerPagerView.identifier
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
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cellType = HomeTableViewSectionType(rawValue: indexPath.section)!
        
        switch cellType {
        case .schedule:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ScheduleTableViewCell.identifier,
                for: indexPath
            ) as! ScheduleTableViewCell
            
            cell.setupCell()
            return cell
        case .teamPlayer:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TeamPlayerPagerView.identifier,
                for: indexPath
            ) as! TeamPlayerPagerView
            
            cell.setupUI()
            return cell
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let cellType = HomeTableViewSectionType(rawValue: section)!
        
        switch cellType {
        case .schedule:
            let scheduleSectionHeader = HomeTableViewSectionHeader()
            scheduleSectionHeader.setupSectionHeader()
            scheduleSectionHeader.update(homeTableViewSectionType: .schedule)
            return scheduleSectionHeader
        case .teamPlayer:
            let playerSectionHeader = HomeTableViewSectionHeader()
            playerSectionHeader.setupSectionHeader()
            playerSectionHeader.update(homeTableViewSectionType: .teamPlayer)
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
        let cellType = HomeTableViewSectionType(rawValue: indexPath.section)!
        
        switch cellType {
        case .schedule:
            return 190
        case .teamPlayer:
            return 337
        }
    }
}
