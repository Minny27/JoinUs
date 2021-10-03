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
    let homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Join Us", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let teamTabbarCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(homeButton)
        
        configureUI()
    }
    
    func configureUI() {
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        teamTabbarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        homeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        homeButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        teamTabbarCollectionView.topAnchor.constraint(equalTo: homeButton.topAnchor, constant: 50).isActive = true
        teamTabbarCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        teamTabbarCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        teamTabbarCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        teamTabbarCollectionView.register(teamTabbarCollectionViewCell.self, forCellWithReuseIdentifier: teamTabbarId)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
