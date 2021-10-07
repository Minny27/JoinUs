//
//  ViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/03.
//

import UIKit

private let teamTabbarId = "teamTabbarCollectionViewCell"

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let teamTabbarViewmodel = TeamTabbarViewModel()
    
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
            teamTabbarCollectionView.heightAnchor.constraint(equalToConstant: 100),
//            teamTabbarCollectionView.contentInset.left(
        ])
        
    }
}

extension ViewController: UICollectionViewDataSource {
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamTabbarId, for: indexPath) as? TeamTabbarCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let teamInfo = teamTabbarViewmodel.teamInfo(at: indexPath.row)
        cell.update(teamInfo: teamInfo)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}
