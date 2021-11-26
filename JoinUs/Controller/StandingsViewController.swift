//
//  RankingViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit
import Alamofire
import SwiftSoup

class StandingsViewController: UIViewController {
    let standingsViewModel = StandingsViewModel()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "LCK 순위"
        
        return label
    }()
    
    let standingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        standingsViewModel.standingsList.bind { _ in
            DispatchQueue.main.async {
                self.standingsTableView.reloadData()
            }
        }
        
        standingsViewModel.fetchStandingsData()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(standingsTableView)
        
        standingsTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        standingsTableView.register(StandingsTableViewCell.self, forCellReuseIdentifier: StandingsTableViewCell.identifier)
        
        standingsTableView.dataSource = self
        standingsTableView.delegate = self
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        standingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            standingsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            standingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            standingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            standingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
    }

}

extension StandingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standingsViewModel.countStandingsInfoList + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let standingsType = StandingsType(rawValue: indexPath.row)
        
        switch standingsType {
        case .category:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configureCell()
            
            return cell
            
        case .none:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingsTableViewCell.identifier, for: indexPath) as? StandingsTableViewCell else {
                return UITableViewCell()
            }
            
            let standingsInfo = standingsViewModel.standingsInfo(at: indexPath.row - 1)
            
            cell.configureCell()
            cell.update(standingsInfo: standingsInfo!)
            
            return cell
        }
    }
}

extension StandingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
