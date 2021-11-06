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
    
    let leagueTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureUI() {
        contentView.addSubview(leagueTableView)
        
        leagueTableView.register(LeagueScheduleTableViewCell.self, forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier)
        
        leagueTableView.dataSource = self
        leagueTableView.delegate = self
        
        leagueTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leagueTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leagueTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leagueTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leagueTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}

extension ScheduleTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if worldsRunningViewModel.scheduleList.count > 0 || lckRunningViewModel.scheduleList.count > 0 {
            return 1
        }
        
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if worldsRunningViewModel.scheduleList.count > 0 {
            return worldsRunningViewModel.scheduleList.count
        }
        
        else if lckRunningViewModel.scheduleList.count > 0 {
            return lckRunningViewModel.scheduleList.count
        }
        
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if worldsRunningViewModel.scheduleList.count > 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            let leagueScheduleInfo = worldsRunningViewModel.scheduleInfo(at: indexPath.row)
            
            cell.configureUI()
            cell.update(scheduleTableViewCellModel: leagueScheduleInfo)
            
            return cell
        }
        
        else if lckRunningViewModel.scheduleList.count > 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            let leagueScheduleInfo = lckRunningViewModel.scheduleInfo(at: indexPath.row)
            
            cell.configureUI()
            cell.update(scheduleTableViewCellModel: leagueScheduleInfo)
            
            return cell
        }
        
        else {
            return UITableViewCell()
        }
    }
}

extension ScheduleTableViewCell: UITableViewDelegate {
    
}
