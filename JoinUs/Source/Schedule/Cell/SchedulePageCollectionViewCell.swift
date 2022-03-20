//
//  PageMonthCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2022/02/15.
//

import UIKit

class SchedulePageCollectionViewCell: UICollectionViewCell {
    static let identifier = "PageMonthCollectionViewCell"
    
    var lckMonthScheduleList = [LeagueScheduleTableViewCellModel]()
    var refreshTableViewDelegate: RefreshTableViewDelegate?
    var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(
            self,
            action: #selector(scheduleRefresh),
            for: .valueChanged
        )
        return refreshControl
    }()
    
    let monthScheduleTableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorInset = .zero
        tableview.separatorStyle = .none
        tableview.showsVerticalScrollIndicator = false

        if #available(iOS 15.0, *) {
            tableview.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    func setupMonthScheduleTableView() {
        contentView.addSubview(monthScheduleTableView)
        
        monthScheduleTableView.register(
            DailyScheduleTitle.self,
            forCellReuseIdentifier: DailyScheduleTitle.identifier
        )
        monthScheduleTableView.register(
            LeagueScheduleTableViewCell.self,
            forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier
        )
        
        monthScheduleTableView.dataSource = self
        monthScheduleTableView.delegate = self
        
        monthScheduleTableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        monthScheduleTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        monthScheduleTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        monthScheduleTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        monthScheduleTableView.refreshControl = refreshControl
        monthScheduleTableView.reloadData()
    }
    
    @objc func scheduleRefresh() {
        lckMonthScheduleList = []
        refreshTableViewDelegate?.refetchData()
    }
}

extension SchedulePageCollectionViewCell: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if lckMonthScheduleList.count > 0 {
            return lckMonthScheduleList.count
        }

        else {
            return 0
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if lckMonthScheduleList.count > 0 {
            monthScheduleTableView.separatorStyle = .singleLine
            
            if indexPath.row ==
                lckMonthScheduleList.count - 1 || lckMonthScheduleList[indexPath.row].matchId != lckMonthScheduleList[indexPath.row + 1].matchId {
                
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LeagueScheduleTableViewCell.identifier,
                    for: indexPath
                ) as! LeagueScheduleTableViewCell
                
                let leagueScheduleInfo = lckMonthScheduleList[indexPath.row]
                
                cell.selectionStyle = .none
                cell.setupCell()
                cell.update(leagueScheduleInfo: leagueScheduleInfo)
                return cell
            }
            
            else {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: DailyScheduleTitle.identifier,
                    for: indexPath
                ) as! DailyScheduleTitle
                
                let leagueScheduleInfo = lckMonthScheduleList[indexPath.row]
                
                cell.selectionStyle = .none
                cell.configureCell()
                cell.update(leagueScheduleInfo: leagueScheduleInfo)
                return cell
            }
        }
        
        else {
            return UITableViewCell()
        }
    }
}

extension SchedulePageCollectionViewCell: UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let refreshControl = monthScheduleTableView.refreshControl {
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
}
