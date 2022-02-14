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
    
    var leagueScheduleTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.showsVerticalScrollIndicator = false
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        }
        
        return tableView
    }()
    
    func configureCell() {
        contentView.addSubview(leagueScheduleTableView)
        
        leagueScheduleTableView.register(
            LeagueScheduleTableViewCell.self,
            forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier
        )
        
        leagueScheduleTableView.register(
            NoScheduleTableViewCell.self,
            forCellReuseIdentifier: NoScheduleTableViewCell.identifier
        )
        
        leagueScheduleTableView.dataSource = self
        leagueScheduleTableView.delegate = self
        
        leagueScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leagueScheduleTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leagueScheduleTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            leagueScheduleTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leagueScheduleTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        ])
        
        self.worldsTodayScheduleViewModel.fetchTodayData()
        self.lckTodayScheduleViewModel.fetchTodayData()
            
        self.worldsTodayScheduleViewModel.todayScheduleList.bind { _ in
            DispatchQueue.main.async {
                if self.worldsTodayScheduleViewModel.countTodayScheduleList > 0 {
                    self.leagueType = "worlds"
                }
                
                self.leagueScheduleTableView.reloadData()
            }
        }
        
        self.lckTodayScheduleViewModel.todayScheduleList.bind { _ in
            DispatchQueue.main.async {
                if self.lckTodayScheduleViewModel.countTodayScheduleList > 0 {
                    self.leagueType = "lck"
                }
                
                self.leagueScheduleTableView.reloadData()
            }
        }
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
            leagueScheduleTableView.separatorColor = .systemGray3
            let leagueScheduleTableViewSectionType = LeagueScheduleTableViewSectionType(rawValue: leagueType)!
            
            switch leagueScheduleTableViewSectionType {
            case .worlds:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                    return UITableViewCell()
                }
                
                let leagueScheduleInfo = worldsTodayScheduleViewModel.todayScheduleInfo(at: indexPath.row)
                
                cell.selectionStyle = .none
                cell.configureUI()
                cell.update(leagueScheduleInfo: leagueScheduleInfo!)
                
                return cell
                
            case .lck:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                    return UITableViewCell()
                }
                
                let leagueScheduleInfo = lckTodayScheduleViewModel.todayScheduleInfo(at: indexPath.row)
                
                cell.selectionStyle = .none
                cell.configureUI()
                cell.update(leagueScheduleInfo: leagueScheduleInfo!)
                
                return cell
            }
        }
        
        else {
            if !worldsTodayScheduleViewModel.hasTodayData && !lckTodayScheduleViewModel.hasTodayData {
                leagueScheduleTableView.separatorColor = .clear
                
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NoScheduleTableViewCell.identifier,
                    for: indexPath
                ) as? NoScheduleTableViewCell else {
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
                worldsSectionHeader.configureUI()
                worldsSectionHeader.update(leagueScheduleTableViewSectionType: .worlds)
                
                return worldsSectionHeader
                
            case .lck:
                let lckSectionHeader = LeagueScheduleTableViewSectionHeader()
                lckSectionHeader.configureUI()
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
            return 150
        }
        
        return 50
    }
}
