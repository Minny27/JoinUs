//
//  tableViewCellTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/18.
//

import UIKit

final class ScheduleTableViewCell: UITableViewCell {
    static let identifier = "scheduleTableViewCell"
    
    let worldsTodayScheduleViewModel = LeagueScheduleTableViewModel(leagueType: .worlds)
    let lckTodayScheduleViewModel = LeagueScheduleTableViewModel(leagueType: .lck)
    var leagueType: String?
    
    let leagueScheduleTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let customActivityIndicatorView = CustomActivityIndicatorView()
    
    func setupLeagueScheduleTableView() {
        contentView.addSubview(leagueScheduleTableView)
        
        leagueScheduleTableView.register(
            LeagueScheduleTableViewCell.self,
            forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier
        )
        leagueScheduleTableView.register(
            NoTodayScheduleTableViewCell.self,
            forCellReuseIdentifier: NoTodayScheduleTableViewCell.identifier
        )
        
        leagueScheduleTableView.dataSource = self
        leagueScheduleTableView.delegate = self
        
        leagueScheduleTableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        leagueScheduleTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        leagueScheduleTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leagueScheduleTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupLoadingView() {
        leagueScheduleTableView.addSubview(customActivityIndicatorView)
        customActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        customActivityIndicatorView.centerXAnchor.constraint(equalTo: leagueScheduleTableView.centerXAnchor).isActive = true
        customActivityIndicatorView.centerYAnchor.constraint(equalTo: leagueScheduleTableView.centerYAnchor).isActive = true
        customActivityIndicatorView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        customActivityIndicatorView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func fetchData() {
        worldsTodayScheduleViewModel.fetchTodayData()
        worldsTodayScheduleViewModel.todayScheduleList.bind { _ in
            DispatchQueue.main.async {
                if self.worldsTodayScheduleViewModel.countTodayScheduleList > 0 {
                    self.leagueType = "worlds"
                }
                self.leagueScheduleTableView.reloadData()
            }
        }
        
        lckTodayScheduleViewModel.fetchTodayData()
        lckTodayScheduleViewModel.todayScheduleList.bind { _ in
            DispatchQueue.main.async {
                if self.lckTodayScheduleViewModel.countTodayScheduleList > 0 {
                    self.leagueType = "lck"
                }
                self.leagueScheduleTableView.reloadData()
            }
        }
    }
    
    func setupCell() {
        setupLeagueScheduleTableView()
        setupLoadingView()
        fetchData()
    }
}

extension ScheduleTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let leagueType = leagueType {
            let leagueScheduleTableViewSectionType = LeagueScheduleTableViewSectionType(rawValue: leagueType)!
            
            switch leagueScheduleTableViewSectionType {
            case .worlds:
                return worldsTodayScheduleViewModel.countTodayScheduleList
            case .lck:
                return lckTodayScheduleViewModel.countTodayScheduleList
            }
        }
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if let leagueType = leagueType {
            customActivityIndicatorView.loadingView.stopAnimating()
            leagueScheduleTableView.separatorColor = .systemGray3
            let leagueScheduleTableViewSectionType = LeagueScheduleTableViewSectionType(rawValue: leagueType)!
            
            switch leagueScheduleTableViewSectionType {
            case .worlds:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                    return UITableViewCell()
                }
                
                let leagueScheduleInfo = worldsTodayScheduleViewModel.todayScheduleInfo(at: indexPath.row)
                
                cell.selectionStyle = .none
                cell.setupCell()
                cell.update(leagueScheduleInfo: leagueScheduleInfo!)
                return cell
                
            case .lck:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                    return UITableViewCell()
                }
                
                let leagueScheduleInfo = lckTodayScheduleViewModel.todayScheduleInfo(at: indexPath.row)
                
                cell.selectionStyle = .none
                cell.setupCell()
                cell.update(leagueScheduleInfo: leagueScheduleInfo!)
                return cell
            }
        }
        
        else {
            if !worldsTodayScheduleViewModel.hasTodayData && !lckTodayScheduleViewModel.hasTodayData {
                customActivityIndicatorView.loadingView.stopAnimating()
                
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NoTodayScheduleTableViewCell.identifier,
                    for: indexPath
                ) as? NoTodayScheduleTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.selectionStyle = .none
                cell.configureCell()
                return cell
            }
            
            else {
                return UITableViewCell()
            }
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        if let leagueType = leagueType {
            let leagueScheduleTableViewSectionType = LeagueScheduleTableViewSectionType(rawValue: leagueType)!
            
            switch leagueScheduleTableViewSectionType {
            case .worlds:
                let worldsSectionHeader = LeagueScheduleTableViewSectionHeader()
                worldsSectionHeader.setupSectionHeader()
                worldsSectionHeader.update(leagueScheduleTableViewSectionType: .worlds)
                return worldsSectionHeader
                
            case .lck:
                let lckSectionHeader = LeagueScheduleTableViewSectionHeader()
                lckSectionHeader.setupSectionHeader()
                lckSectionHeader.update(leagueScheduleTableViewSectionType: .lck)
                return lckSectionHeader
            }
        }
        return UIView()
    }
}

extension ScheduleTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !worldsTodayScheduleViewModel.hasTodayData && !lckTodayScheduleViewModel.hasTodayData {
            return 100
        }
        return 50
    }
}
