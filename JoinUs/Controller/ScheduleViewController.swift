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
    let lckRunningViewModel = LeagueScheduleTableViewModel(dataType: .running(league: "worlds"))
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "LCK 일정"
        
        return label
    }()
    
    let monthCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    let scheduleTableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        if #available(iOS 15.0, *) {
            tableview.sectionHeaderTopPadding = .zero
        } else {
            // Fallback on earlier versions
        }
        
        return tableview
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        lckRunningViewModel.fetchData()

        lckRunningViewModel.scheduleList.bind { _ in
            DispatchQueue.main.async {
                self.scheduleTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lckRunningViewModel.fetchData()
        
        lckRunningViewModel.scheduleList.bind { _ in
            DispatchQueue.main.async {
                self.scheduleTableView.reloadData()
            }
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(monthCollectionView)
        view.addSubview(scheduleTableView)
        
        monthCollectionView.register(MonthCollectionViewCell.self, forCellWithReuseIdentifier: MonthCollectionViewCell.identifier)
        scheduleTableView.register(LeagueScheduleTableViewCell.self, forCellReuseIdentifier: LeagueScheduleTableViewCell.identifier)
        
        monthCollectionView.dataSource = self
        monthCollectionView.delegate = self
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        monthCollectionView.translatesAutoresizingMaskIntoConstraints = false
        scheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            monthCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            monthCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            monthCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            monthCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            scheduleTableView.topAnchor.constraint(equalTo: monthCollectionView.bottomAnchor, constant: 10),
            scheduleTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            scheduleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scheduleTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
}

extension ScheduleViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monthCollectionViewModel.countMonthList
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCollectionViewCell.identifier, for: indexPath) as? MonthCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        let monthInfo = monthCollectionViewModel.monthInfo(at: indexPath.row)
        
        cell.configureCell()
        cell.update(monthInfo: monthInfo)
        
        return cell
    }
}

extension ScheduleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 30)
    }
}

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lckRunningViewModel.scheduleList.value!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueScheduleTableViewCell.identifier, for: indexPath) as? LeagueScheduleTableViewCell else {
            return UITableViewCell()
        }
        
        let leagueScheduleInfo = lckRunningViewModel.scheduleInfo(at: indexPath.row)
        
        cell.configureUI()
        cell.update(leagueScheduleTableViewCellModel: leagueScheduleInfo!)
        
        return cell
    }
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
