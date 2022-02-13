//
//  ScheduleViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    // MARK: - Properties
    let monthCollectionViewModel = MonthCollectionViewModel()
    let lckMonthScheduleViewModel = LeagueScheduleTableViewModel(leagueType: .lck)
    
    var selectedMonth: Int = Int(DateFormatter().dateToString(date: Date(), dateFormat: .month))!
    var monthlyTableViewCellType: Int = 0
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LCK 일정"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    }()
    
    let monthCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowlayout
        )
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let monthlyScheduleTableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorInset = .zero
        tableview.showsVerticalScrollIndicator = false
        
        if #available(iOS 15.0, *) {
            tableview.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        return tableview
    }()
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        lckMonthScheduleViewModel.fetchMonthData()
        
        self.lckMonthScheduleViewModel.monthlyScheduleList.bind { _ in
            DispatchQueue.main.async {
                self.monthlyScheduleTableView.reloadData()
            }
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(containerView)
        view.addSubview(monthCollectionView)
        view.addSubview(monthlyScheduleTableView)
        containerView.addSubview(titleLabel)
        
        monthCollectionView.register(
            MonthCollectionViewCell.self,
            forCellWithReuseIdentifier: MonthCollectionViewCell.identifier
        )
        monthlyScheduleTableView.register(
            DailyScheduleTitle.self,
            forCellReuseIdentifier: DailyScheduleTitle.identifier
        )
        monthlyScheduleTableView.register(
            LeagueScheduleTableViewCell.self,
            forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier
        )
        monthlyScheduleTableView.register(
            NoScheduleTableViewCell.self,
            forCellReuseIdentifier: NoScheduleTableViewCell.identifier
        )
        
        monthCollectionView.dataSource = self
        monthCollectionView.delegate = self
        monthlyScheduleTableView.dataSource = self
        monthlyScheduleTableView.delegate = self
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        monthCollectionView.translatesAutoresizingMaskIntoConstraints = false
        monthlyScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            monthCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            monthCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            monthCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            monthCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            monthlyScheduleTableView.topAnchor.constraint(equalTo: monthCollectionView.bottomAnchor, constant: 10),
            monthlyScheduleTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            monthlyScheduleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            monthlyScheduleTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
}

extension ScheduleViewController: UICollectionViewDataSource {
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return monthCollectionViewModel.countMonthList
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCollectionViewCell.identifier, for: indexPath) as! MonthCollectionViewCell
        
        let monthInfo = monthCollectionViewModel.monthInfo(at: indexPath.row)
        
        cell.configureCell()
        cell.update(monthInfo: monthInfo)
        
        return cell
    }
}

extension ScheduleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 40, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let monthCellInfo = monthCollectionViewModel.monthInfo(at: indexPath.row)
        selectedMonth = Int(monthCellInfo.month.replacingOccurrences(of: "월", with: ""))!
        monthlyScheduleTableView.reloadData()
    }
}

extension ScheduleViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if lckMonthScheduleViewModel.hasMonthData[selectedMonth] {
            return lckMonthScheduleViewModel.countMonthlyScheduleList(month: selectedMonth)
        }
        
        else {
            return 1
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if lckMonthScheduleViewModel.hasMonthData[selectedMonth] {
            monthlyScheduleTableView.separatorColor = .lightGray
            
            if indexPath.row ==
                lckMonthScheduleViewModel.monthlyScheduleList.value![selectedMonth].count - 1 ||  lckMonthScheduleViewModel.monthlyScheduleList.value![selectedMonth][indexPath.row].homeTeam != lckMonthScheduleViewModel.monthlyScheduleList.value![selectedMonth][indexPath.row + 1].homeTeam {
                
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LeagueScheduleTableViewCell.identifier,
                    for: indexPath
                ) as! LeagueScheduleTableViewCell
                
                let leagueScheduleInfo = lckMonthScheduleViewModel.monthScheduleInfo(month: selectedMonth, index: indexPath.row)!
                
                cell.selectionStyle = .none
                cell.configureUI()
                cell.update(leagueScheduleInfo: leagueScheduleInfo)
                return cell
            }
            
            else {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: DailyScheduleTitle.identifier,
                    for: indexPath
                ) as! DailyScheduleTitle
                
                let leagueScheduleInfo = lckMonthScheduleViewModel.monthScheduleInfo(month: selectedMonth, index: indexPath.row)
                
                cell.selectionStyle = .none
                cell.configureCell()
                cell.update(schedule: leagueScheduleInfo!)
                return cell
            }
        }
        
        else {
            monthlyScheduleTableView.separatorColor = .clear
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NoScheduleTableViewCell.identifier,
                for: indexPath
            ) as! NoScheduleTableViewCell
            
            cell.selectionStyle = .none
            cell.configureCell()
            
            return cell
        }
    }
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        if !lckMonthScheduleViewModel.hasMonthData[selectedMonth] {
            return 100
        }
        return 50
    }
}
