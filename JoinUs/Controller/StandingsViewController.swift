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
    
    // MARK: - Properties
    static var selectedSeasonIndex = 0
    
    let standingsViewModel = StandingsViewModel()
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let seasonSelectionButton: UIButton = {
        let button = UIButton()
        button.setTitle(
            "시즌 선택",
            for: .normal
        )
        button.setTitleColor(
            .lightGray,
            for: .normal
        )
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.titleLabel?.textAlignment = .center
        
        button.addTarget(
            self,
            action: #selector(clickSeasonSelectionButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LCK 순위"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    }()
    
    let standingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(
            top: 0,
            left: 10,
            bottom: 0,
            right: 10
        )
                
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
        
        configureUI()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didDismissPopUpViewNotification(_:)),
            name: Notification.Name(Strings.didDismissPopUpViewNotification),
            object: nil
        )
        
        standingsViewModel.standingsList.bind { _ in
            DispatchQueue.main.async {
                self.standingsTableView.reloadData()
            }
        }
        
        standingsViewModel.fetchStandingsData(urlString: RequestSeason.urlPath)
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(containerView)
        view.addSubview(standingsTableView)
        containerView.addSubview(seasonSelectionButton)
        containerView.addSubview(titleLabel)
        
        standingsTableView.register(
            CategoryTableViewCell.self,
            forCellReuseIdentifier: CategoryTableViewCell.identifier
        )
        standingsTableView.register(
            StandingsTableViewCell.self,
            forCellReuseIdentifier: StandingsTableViewCell.identifier)
        
        standingsTableView.dataSource = self
        standingsTableView.delegate = self
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        seasonSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        standingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            seasonSelectionButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            seasonSelectionButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
            seasonSelectionButton.widthAnchor.constraint(equalToConstant: 50),
            seasonSelectionButton.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            standingsTableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10),
            standingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            standingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            standingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    @objc func clickSeasonSelectionButton() {
        let popUpViewController = PopUpViewController()
        popUpViewController.modalPresentationStyle = .overFullScreen
        
        present(
            popUpViewController,
            animated: false,
            completion: nil
        )
    }
    
    @objc func didDismissPopUpViewNotification(_ notification: NSNotification) {
        standingsViewModel.fetchStandingsData(urlString: notification.userInfo!["urlString"]! as! String)
    }
}

extension StandingsViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return standingsViewModel.countStandingsList + 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let standingsType = StandingsType(rawValue: indexPath.row)
        
        switch standingsType {
        case .category:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CategoryTableViewCell.identifier,
                for: indexPath) as? CategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.configureCell()
            
            return cell
            
        case .none:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StandingsTableViewCell.identifier,
                for: indexPath) as? StandingsTableViewCell else {
                return UITableViewCell()
            }
            
            let standingsInfo = standingsViewModel.standingsInfo(at: indexPath.row - 1)
            
            cell.selectionStyle = .none
            cell.configureCell()
            cell.update(standingsInfo: standingsInfo!)
            
            return cell
        }
    }
}

extension StandingsViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 50
    }
}
