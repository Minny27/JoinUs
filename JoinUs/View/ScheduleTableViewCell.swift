//
//  tableViewCellTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/18.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    static let identifier = "scheduleTableViewCell"

    let worldsPastViewModel = ScheduleTableViewModel(dataType: .past(league: "worlds"))
    let worldsRunningViewModel = ScheduleTableViewModel(dataType: .running(league: "worlds"))
    let worldsUpcomingViewModel = ScheduleTableViewModel(dataType: .upcoming(league: "worlds"))
    let lckPastViewModel = ScheduleTableViewModel(dataType: .past(league: "lck"))
    let lckRunningViewModel = ScheduleTableViewModel(dataType: .running(league: "lck"))
    let lckUpcomingViewModel = ScheduleTableViewModel(dataType: .upcoming(league: "lck"))
    
    var leagueScheduleTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        
        return tableView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {        
        contentView.addSubview(leagueScheduleTableView)
        
        leagueScheduleTableView.register(LeagueScheduleTableViewCell.self, forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier)
        
        leagueScheduleTableView.dataSource = self
        leagueScheduleTableView.delegate = self
        
        leagueScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leagueScheduleTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leagueScheduleTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leagueScheduleTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leagueScheduleTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
        
        DispatchQueue.global(qos: .userInteractive).async {
            
        
            self.worldsRunningViewModel.fetchData()
            self.lckRunningViewModel.fetchData()
            
            self.worldsRunningViewModel.scheduleList.bind { _ in
                DispatchQueue.main.async {
                    self.leagueScheduleTableView.reloadData()
                }
            }
            
            self.lckRunningViewModel.scheduleList.bind { _ in
                DispatchQueue.main.async {
                    self.leagueScheduleTableView.reloadData()
                }
            }
        }
    }
}

extension ScheduleTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        var countSection: Int = 0
        
        if worldsRunningViewModel.scheduleList.value!.count > 0 {
            countSection += 1
        }
        
        if lckRunningViewModel.scheduleList.value!.count > 0 {
            countSection += 1
        }
        
        return countSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableViewSectionType = LeagueSectionHeaderType(rawValue: section)!
        
        switch tableViewSectionType {
        case .worlds:
            return worldsRunningViewModel.scheduleList.value!.count
        case .lck:
            return lckRunningViewModel.scheduleList.value!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewSectionType = LeagueSectionHeaderType(rawValue: indexPath.section)!
        
        switch tableViewSectionType {
        case .worlds:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            let leagueScheduleInfo = worldsRunningViewModel.scheduleInfo(at: indexPath.row)
            
            cell.configureUI()
            cell.update(scheduleTableViewCellModel: leagueScheduleInfo!)
            
            return cell
            
        case .lck:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            let leagueScheduleInfo = lckRunningViewModel.scheduleInfo(at: indexPath.row)
            
            cell.configureUI()
            cell.update(scheduleTableViewCellModel: leagueScheduleInfo!)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tableViewSectionType = LeagueSectionHeaderType(rawValue: section)!
        
        switch tableViewSectionType {
        case .worlds:
            let worldsSectionHeader = LeagueScheduleSectionHeader()
            worldsSectionHeader.configureUI(sectionHeaderType: .worlds)
            
            return worldsSectionHeader
            
        case .lck:
            let lckSectionHeader = LeagueScheduleSectionHeader()
            lckSectionHeader.configureUI(sectionHeaderType: .lck)
            
            return lckSectionHeader
        }
    }
}

extension ScheduleTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
