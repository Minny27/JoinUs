//
//  PlayerViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit

class PlayerViewController: UIViewController {
    
    // MARK: - Properties
    let playerCollectionViewModel = PlayerCollectionViewModel()
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .lightGray
        
        button.addTarget(
            self,
            action: #selector(clickSearchButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LCK Player"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    }()
    
    let playerCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 0
        flowlayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.backgroundColor = .white
        collectionView.layer.borderWidth = 2
        collectionView.layer.cornerRadius = 10
        collectionView.layer.borderColor = UIColor.systemGray3.cgColor
        
        return collectionView
    }()
        
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(containerView)
        view.addSubview(playerCollectionView)
        containerView.addSubview(searchButton)
        containerView.addSubview(titleLabel)
        
        playerCollectionView.register(TeamPlayerCollectionViewCell.self, forCellWithReuseIdentifier: TeamPlayerCollectionViewCell.identifier)
        
        playerCollectionView.dataSource = self
        playerCollectionView.delegate = self
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        playerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            searchButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            searchButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            searchButton.widthAnchor.constraint(equalToConstant: 30),
            searchButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            playerCollectionView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
            playerCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            playerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
        ])
    }
    
    @objc func clickSearchButton() {
        let playerSearchViewController = PlayerSearchViewController()
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(playerSearchViewController, animated: true)
    }
    
    @objc func clickBackButton() {
        dismiss(animated: false, completion: nil)
    }
}

extension PlayerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerCollectionViewModel.countPlayerList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamPlayerCollectionViewCell.identifier, for: indexPath) as? TeamPlayerCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        let playerInfo = playerCollectionViewModel.playerInfo(at: indexPath.row)
        
        cell.configureUI()
        cell.update(playerInfo: playerInfo)
                
        return cell
    }
}

extension PlayerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerDetailViewController = PlayerDetailViewController()
        playerDetailViewController.playerInfo = playerCollectionViewModel.playerInfo(at: indexPath.row)
        
        self.navigationController?.pushViewController(playerDetailViewController, animated: true)
    }
}

extension PlayerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 150)
    }
}
