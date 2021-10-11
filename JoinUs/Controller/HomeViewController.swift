//
//  ViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/03.
//

import UIKit

private let teamTabbarId = "teamTabbarCollectionViewCell"

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let teamTabbarViewmodel = TeamTabbarViewModel()
    let teamTabbarCellWidth: [Int] = [100, 95, 55, 65, 65, 100, 95, 80, 60, 75]
    var isTeamAssigned: [Bool] = Array(repeating: false, count: 10)
    
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
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(homeButton)
        view.addSubview(teamTabbarCollectionView)
        
        teamTabbarCollectionView.register(TeamTabbarCollectionViewCell.self, forCellWithReuseIdentifier: teamTabbarId)
        
        teamTabbarCollectionView.dataSource = self
        teamTabbarCollectionView.delegate = self
        
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        teamTabbarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeButton.heightAnchor.constraint(equalToConstant: 80),
            
            teamTabbarCollectionView.topAnchor.constraint(equalTo: homeButton.bottomAnchor),
            teamTabbarCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            teamTabbarCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            teamTabbarCollectionView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamTabbarId, for: indexPath) as? TeamTabbarCollectionViewCell else {
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
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        return
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: teamTabbarCellWidth[indexPath.row], height: 30)
    }
}
