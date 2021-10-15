//
//  ViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let teamTabbarCellWidth: [Int] = [100, 95, 55, 65, 65, 100, 95, 80, 60, 75]
    var isTeamAssigned: [Bool] = Array(repeating: false, count: 10)
    var teamRow = 0
    
    let teamTabbarViewmodel = TeamTabbarViewModel()
    let playerCollectionViewModel = PlayerCollectionViewModel()
    
    let homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Join Us", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 45)
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    let teamTabbarCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        
        return collectionView
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
        view.addSubview(teamTabbarCollectionView)
        view.addSubview(playerCollectionView)
        
        teamTabbarCollectionView.register(TeamTabbarCollectionViewCell.self, forCellWithReuseIdentifier: TeamTabbarCollectionViewCell.identifier)
        playerCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        
        teamTabbarCollectionView.dataSource = self
        teamTabbarCollectionView.delegate = self
        playerCollectionView.dataSource = self
        playerCollectionView.delegate = self
        
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        teamTabbarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        playerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeButton.heightAnchor.constraint(equalToConstant: 80),
            
            teamTabbarCollectionView.topAnchor.constraint(equalTo: homeButton.bottomAnchor),
            teamTabbarCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            teamTabbarCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            teamTabbarCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            playerCollectionView.topAnchor.constraint(equalTo: teamTabbarCollectionView.bottomAnchor),
            playerCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            playerCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            playerCollectionView.heightAnchor.constraint(equalToConstant: 348)
        ])
        
    }
}

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
                
                cell.configureUI(index: indexPath.row, width: CGFloat(teamTabbarCellWidth[indexPath.row]))
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

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == teamTabbarCollectionView {
            return CGSize(width: teamTabbarCellWidth[indexPath.row], height: 30)
        }
        
        else {
            return CGSize(width: (playerCollectionView.frame.width - 40) / 3, height: 169)
        }
    }
}

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
