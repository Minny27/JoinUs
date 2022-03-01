//
//  RankingViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit

class StandingsViewController: UIViewController {
    
    // MARK: - Properties
    static var selectedSeasonIndex = 0
    
    let standingsViewModel = StandingsViewModel()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LCK 순위"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let customActivityIndicatorView = CustomActivityIndicatorView()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupStandingsTableView()
        setupLoadingView()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didDismissPopUpViewNotification(_:)),
            name: Notification.Name(Strings.didDismissPopUpViewNotification),
            object: nil
        )
        
        standingsViewModel.fetchStandingsData(urlString: RequestSeason.urlPath)
        
        standingsViewModel.standingsList.bind { _ in
            DispatchQueue.main.async {
                self.standingsTableView.reloadData()
            }
        }
    }
    
    func setupTitle() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.addSubview(seasonSelectionButton)
        seasonSelectionButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive = true
        seasonSelectionButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15).isActive = true
        seasonSelectionButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        seasonSelectionButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        containerView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupStandingsTableView() {
        view.addSubview(standingsTableView)
        
        standingsTableView.register(
            CategoryTableViewCell.self,
            forCellReuseIdentifier: CategoryTableViewCell.identifier
        )
        standingsTableView.register(
            StandingsTableViewCell.self,
            forCellReuseIdentifier: StandingsTableViewCell.identifier)
        
        standingsTableView.dataSource = self
        standingsTableView.delegate = self
        
        standingsTableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10).isActive = true
        standingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        standingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        standingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupLoadingView() {
        standingsTableView.addSubview(customActivityIndicatorView)
        customActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        customActivityIndicatorView.centerXAnchor.constraint(equalTo: standingsTableView.centerXAnchor).isActive = true
        customActivityIndicatorView.centerYAnchor.constraint(equalTo: standingsTableView.centerYAnchor).isActive = true
        customActivityIndicatorView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        customActivityIndicatorView.heightAnchor.constraint(equalToConstant: 80).isActive = true
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
        if standingsViewModel.countStandingsList > 0 {
            customActivityIndicatorView.loadingView.stopAnimating()
        }
        
        let standingsType = StandingsType(rawValue: indexPath.row)
        
        switch standingsType {
        case .category:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CategoryTableViewCell.identifier,
                for: indexPath
            ) as? CategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.configureCell()
            
            return cell
            
        case .none:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StandingsTableViewCell.identifier,
                for: indexPath
            ) as? StandingsTableViewCell else {
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
