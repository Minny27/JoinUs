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
    
    let leagueScheduleTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    let testView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        contentView.addSubview(leagueScheduleTableView)
        leagueScheduleTableView.addSubview(testView)
        
        leagueScheduleTableView.register(LeagueScheduleTableViewCell.self, forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier)
        
        leagueScheduleTableView.dataSource = self
        leagueScheduleTableView.delegate = self
        
        leagueScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        testView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leagueScheduleTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leagueScheduleTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leagueScheduleTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leagueScheduleTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            testView.topAnchor.constraint(equalTo: leagueScheduleTableView.topAnchor),
            testView.leftAnchor.constraint(equalTo: leagueScheduleTableView.leftAnchor),
            testView.bottomAnchor.constraint(equalTo: leagueScheduleTableView.bottomAnchor),
            testView.widthAnchor.constraint(equalToConstant: leagueScheduleTableView.frame.width),
        ])
 
//        worldsRunningViewModel.scheduleList.bind { _ in
//            DispatchQueue.main.async {
//                self.leagueScheduleTableView.reloadData()
//            }
//        }
        
        lckRunningViewModel.scheduleList.bind { _ in
            DispatchQueue.main.async {
                self.leagueScheduleTableView.reloadData()
            }
        }

//        self.worldsRunningViewModel.fetchData()
        self.lckRunningViewModel.fetchData()
    }
}

extension ScheduleTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if worldsRunningViewModel.scheduleList.value!.count > 0 {
            return 1
        }
        
        else if lckRunningViewModel.scheduleList.value!.count > 0 {
            return 1
        }
        
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if worldsRunningViewModel.scheduleList.value!.count > 0 {
            return worldsRunningViewModel.scheduleList.value!.count
        }
        
        else if lckRunningViewModel.scheduleList.value!.count > 0 {
            return lckRunningViewModel.scheduleList.value!.count
        }
        
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if worldsRunningViewModel.scheduleList.value!.count > 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            let leagueScheduleInfo = worldsRunningViewModel.scheduleInfo(at: indexPath.row)
            
            cell.configureUI()
            cell.update(scheduleTableViewCellModel: leagueScheduleInfo!)
            
            return cell
        }
        
        else if lckRunningViewModel.scheduleList.value!.count > 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            let leagueScheduleInfo = lckRunningViewModel.scheduleInfo(at: indexPath.row)
            
            cell.configureUI()
            cell.update(scheduleTableViewCellModel: leagueScheduleInfo!)
            
            return cell
        }
        
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if worldsRunningViewModel.scheduleList.value!.count > 0 {
            let worldsSectionHeader = LeagueScheduleSectionHeader()
            worldsSectionHeader.configureUI(sectionHeaderType: .worlds)
            
            return worldsSectionHeader
        }
        
        else if lckRunningViewModel.scheduleList.value!.count > 0 {
            let lckSectionHeader = LeagueScheduleSectionHeader()
            lckSectionHeader.configureUI(sectionHeaderType: .lck)
            
            return lckSectionHeader
        }
        
        else {
            return UIView()
        }
    }
}

extension ScheduleTableViewCell: UITableViewDelegate {
    
}
