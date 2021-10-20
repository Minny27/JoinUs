//
//  ViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let teamTabbarCellWidth: [Int] = [80, 75, 50, 55, 55, 80, 75, 65, 50, 60]
    var isTeamAssigned: [Bool] = Array(repeating: false, count: 10)
    var teamRow = 0
    
    let teamTabbarViewmodel = TeamTabbarViewModel()
    let playerCollectionViewModel = PlayerCollectionViewModel()
    
    let homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Join Us", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    let scheduleTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    let teamTabbarCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    let playerSectionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LCK Player"
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let playerCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.layer.borderWidth = 2
        collectionView.layer.cornerRadius = 10
        collectionView.layer.borderColor = UIColor.systemGray3.cgColor
        
        return collectionView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(homeButton)
        view.addSubview(scheduleTableView)
        view.addSubview(playerSectionHeaderLabel)
        view.addSubview(teamTabbarCollectionView)
        view.addSubview(playerCollectionView)
        
        scheduleTableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        teamTabbarCollectionView.register(TeamTabbarCollectionViewCell.self, forCellWithReuseIdentifier: TeamTabbarCollectionViewCell.identifier)
        playerCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        teamTabbarCollectionView.dataSource = self
        teamTabbarCollectionView.delegate = self
        playerCollectionView.dataSource = self
        playerCollectionView.delegate = self
        
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        scheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        playerSectionHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        teamTabbarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        playerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeButton.heightAnchor.constraint(equalToConstant: 80),
            
            scheduleTableView.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10),
            scheduleTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            scheduleTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            scheduleTableView.heightAnchor.constraint(equalToConstant: 250),
            
            playerSectionHeaderLabel.topAnchor.constraint(equalTo: scheduleTableView.bottomAnchor, constant: 30),
            playerSectionHeaderLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            playerSectionHeaderLabel.widthAnchor.constraint(equalToConstant: 100),
            playerSectionHeaderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            teamTabbarCollectionView.topAnchor.constraint(equalTo: playerSectionHeaderLabel.bottomAnchor, constant: 10),
            teamTabbarCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            teamTabbarCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            teamTabbarCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            playerCollectionView.topAnchor.constraint(equalTo: teamTabbarCollectionView.bottomAnchor),
            playerCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            playerCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            playerCollectionView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let scheduleSectionHeader = ScheduleSectionHeader()
        return scheduleSectionHeader
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == teamTabbarCollectionView {
            return 10
        }
        
        else {
            return playerCollectionViewModel.teamPlayerList[teamRow].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == teamTabbarCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamTabbarCollectionViewCell.identifier, for: indexPath) as? TeamTabbarCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            if !isTeamAssigned[indexPath.row] {
                isTeamAssigned[indexPath.row] = true
                
                cell.configureUI(cellIndex: indexPath.row, cellWidth: CGFloat(teamTabbarCellWidth[indexPath.row]))
            }
            
            let teamInfo = teamTabbarViewmodel.teamInfo(at: indexPath.row)
            cell.update(teamInfo: teamInfo)
            cell.layer.borderWidth = 0.3
            cell.layer.cornerRadius = 10
            
            return cell
        }
        
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as? PlayerCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            switch indexPath.row {
            case 0:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 1:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 2:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 3:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 4:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 5:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 6:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 7:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 8:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            case 9:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            default:
                cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[teamRow][indexPath.row])
            }
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamTabbarCollectionView {
            if indexPath.row == teamRow {
                return
            }
            
            teamRow = indexPath.row
            playerCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == teamTabbarCollectionView {
            return CGSize(width: teamTabbarCellWidth[indexPath.row], height: 30)
        }
        
        else {
            return CGSize(width: (playerCollectionView.frame.size.width - 40) / 3, height: 120)
        }
    }
}
