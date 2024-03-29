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
    
    var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(
            self,
            action: #selector(scheduleRefresh),
            for: .valueChanged
        )
        return refreshControl
    }()
    
    var homeTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 0,
                                                  height: 0),
                                    style: .grouped)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupNavigationBar()
        setupHomeTableView()
    }
    
    func setupNavigationBar() {        
        navigationItem.title = "Join Us"
    }
    
    func setupHomeTableView() {
        view.addSubview(homeTableView)
        
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
        
        homeTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
                                             
        homeTableView.addSubview(refreshControl)
    }
    
    @objc func scheduleRefresh() {
        homeTableView.reloadData()
    }
}

extension HomeViewController: PresentPlayerDetailVCDelegate {
    func presentPlayerDetailVC(viewController detilVC: UIViewController) {
        detilVC.navigationItem.title = "선수 정보"

        let navi = UINavigationController(rootViewController: detilVC)
        navi.navigationBar.prefersLargeTitles = true
        navi.navigationBar.tintColor = .gray
        navi.overrideUserInterfaceStyle = .light
        navi.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navi.navigationBar.shadowImage = UIImage()
        navigationController?.present(navi, animated: true, completion  : nil)
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
            cell.presentPlayerDetailVCDelegate = self
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
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if refreshControl.isRefreshing {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.refreshControl.endRefreshing()
            }
        }
    }
    
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
