//
//  tableViewCellTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/18.
//

import UIKit

final class ScheduleTableViewCell: UITableViewCell {
    static let identifier = "scheduleTableViewCell"
    
    let worldsTodayViewModel = LeagueScheduleTableViewModel(leagueType: .worlds)
    let lckTodayViewModel = LeagueScheduleTableViewModel(leagueType: .lck)
    var sectionType: [Int: String] = [:]
    
    var leagueScheduleTableView: UITableView = {
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
    
    func configureCell() {
        contentView.addSubview(leagueScheduleTableView)
        
        leagueScheduleTableView.register(
            LeagueScheduleTableViewCell.self,
            forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier
        )
        
        leagueScheduleTableView.dataSource = self
        leagueScheduleTableView.delegate = self
        
        leagueScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leagueScheduleTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leagueScheduleTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leagueScheduleTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leagueScheduleTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
        
        self.worldsTodayViewModel.fetchData()
        self.lckTodayViewModel.fetchData()
            
        self.worldsTodayViewModel.scheduleList.bind { _ in
            DispatchQueue.main.async {
                self.leagueScheduleTableView.reloadData()
            }
        }
        
        self.lckTodayViewModel.scheduleList.bind { _ in
            DispatchQueue.main.async {
                self.leagueScheduleTableView.reloadData()
            }
        }
    }
}

extension ScheduleTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        var countSection: Int = 0
        
        if worldsTodayViewModel.scheduleList.value!.count > 0 {
            sectionType[countSection] = "worlds"
            countSection += 1
        }
        
        if lckTodayViewModel.scheduleList.value!.count > 0 {
            sectionType[countSection] = "lck"
            countSection += 1
        }
        
        return countSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionType = sectionType[section] {
            let leagueScheduleTableViewSectionType = LeagueScheduleTableViewSectionType(rawValue: sectionType)!
            
            switch leagueScheduleTableViewSectionType {
            case .worlds:
                return worldsTodayViewModel.scheduleList.value!.count
            case .lck:
                return lckTodayViewModel.scheduleList.value!.count
            }
        }
        
        return 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if let sectionType = sectionType[indexPath.section] {
            let leagueScheduleTableViewSectionType = LeagueScheduleTableViewSectionType(rawValue: sectionType)!
            
            switch leagueScheduleTableViewSectionType {
            case .worlds:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                    return UITableViewCell()
                }
                
                let leagueScheduleInfo = worldsTodayViewModel.scheduleInfo(at: indexPath.row)
                
                cell.configureUI()
                cell.update(leagueScheduleTableViewCellModel: leagueScheduleInfo!)
                
                return cell
                
            case .lck:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                    return UITableViewCell()
                }
                
                let leagueScheduleInfo = lckTodayViewModel.scheduleInfo(at: indexPath.row)
                
                cell.configureUI()
                cell.update(leagueScheduleTableViewCellModel: leagueScheduleInfo!)
                
                return cell
            }
        }
        
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        if let sectionType = sectionType[section] {
            let leagueScheduleTableViewSectionType = LeagueScheduleTableViewSectionType(rawValue: sectionType)!
            
            switch leagueScheduleTableViewSectionType {
            case .worlds:
                let worldsSectionHeader = LeagueScheduleTableViewSectionHeader()
                worldsSectionHeader.configureUI(leagueScheduleTableViewSectionType: .worlds)
                
                return worldsSectionHeader
                
            case .lck:
                let lckSectionHeader = LeagueScheduleTableViewSectionHeader()
                lckSectionHeader.configureUI(leagueScheduleTableViewSectionType: .lck)
                
                return lckSectionHeader
            }
        }
        
        return UIView()
    }
}

extension ScheduleTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
