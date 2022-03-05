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
    var standingsViewModel = StandingsViewModel()
    
    var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(
            self,
            action: #selector(standingsRefresh),
            for: .valueChanged
        )
        return refreshControl
    }()
    
    let standingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.showsVerticalScrollIndicator = false
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
        setupNavigationBar()
        setupStandingsTableView()
        setupLoadingView()
        fetchData()
                
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didDismissPopUpViewNotification(_:)),
            name: Notification.Name(Strings.didDismissPopUpViewNotification),
            object: nil
        )
    }
    
    func setupNavigationBar() {
        navigationItem.title = "✪ LCK 순위"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "시즌 선택",
            style: .plain,
            target: #selector(clickSeasonSelectionButton),
            action: nil
        )
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
        
        standingsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        standingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        standingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        standingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        standingsTableView.addSubview(refreshControl)
    }
    
    func setupLoadingView() {
        standingsTableView.addSubview(customActivityIndicatorView)
        customActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        customActivityIndicatorView.centerXAnchor.constraint(equalTo: standingsTableView.centerXAnchor).isActive = true
        customActivityIndicatorView.centerYAnchor.constraint(equalTo: standingsTableView.centerYAnchor).isActive = true
        customActivityIndicatorView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        customActivityIndicatorView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func fetchData() {
        standingsViewModel.fetchStandingsData(urlString: RequestSeason.urlPath)
        
        standingsViewModel.standingsList.bind { _ in
            DispatchQueue.main.async {
                self.standingsTableView.reloadData()
            }
        }
    }
    
    func clearData() {
        standingsViewModel = StandingsViewModel()
        standingsTableView.reloadData()
    }
    
    @objc func clickSeasonSelectionButton() {
//        let popUpViewController = PopUpViewController()
//        popUpViewController.modalPresentationStyle = .overFullScreen
        
//        present(
//            popUpViewController,
//            animated: false,
//            completion: nil
//        )
    }
    
    @objc func didDismissPopUpViewNotification(_ notification: NSNotification) {
        standingsViewModel.fetchStandingsData(urlString: notification.userInfo!["urlString"]! as! String)
    }
    
    @objc func standingsRefresh() {
        clearData()
        fetchData()
        refreshControl.endRefreshing()
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
            cell.setupCell()
            cell.update(standingsInfo: standingsInfo!)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension StandingsViewController: UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let refreshControl = standingsTableView.refreshControl {
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
