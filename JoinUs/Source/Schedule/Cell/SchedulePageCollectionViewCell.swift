//
//  PageMonthCollectionViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2022/02/15.
//

import UIKit

class SchedulePageCollectionViewCell: UICollectionViewCell {
    static let identifier = "PageMonthCollectionViewCell"
    
    var lckMonthScheduleList: [LeagueScheduleTableViewCellModel]? = nil
    var month: Int?
    
    let monthScheduleTableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorInset = .zero
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
        
        if let lckMonthScheduleList = lckMonthScheduleList, monthScheduleTableView.numberOfRows(inSection: 0) == 0 {
            if lckMonthScheduleList.count > 0 {
                monthScheduleTableView.reloadData()
            }
        }
    }
}

extension SchedulePageCollectionViewCell: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if let lckMonthScheduleList = lckMonthScheduleList {
            print("PageMonthCollectionViewCell - \(lckMonthScheduleList.count)개의 데이터 있음")
            return lckMonthScheduleList.count
        }

        else {
            print("PageMonthCollectionViewCell - 현재 값이 없음")
            return 0
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if let lckMonthScheduleList = lckMonthScheduleList {
            monthScheduleTableView.separatorColor = .systemGray3
            
            if indexPath.row ==
                lckMonthScheduleList.count - 1 ||  lckMonthScheduleList[indexPath.row].homeTeam != lckMonthScheduleList[indexPath.row + 1].homeTeam {
                
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LeagueScheduleTableViewCell.identifier,
                    for: indexPath
                ) as! LeagueScheduleTableViewCell
                
                let leagueScheduleInfo = lckMonthScheduleList[indexPath.row]
                print(lckMonthScheduleList[indexPath.row])
                
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
                cell.update(schedule: leagueScheduleInfo)
                return cell
            }
        }
        
        else {
            return UITableViewCell()
        }
    }
}

extension SchedulePageCollectionViewCell: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 50
    }
}
