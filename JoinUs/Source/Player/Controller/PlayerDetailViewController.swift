//
//  PlayerDetailViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/13.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    
    // MARK: - Properties
    var playerInfo: Player?
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let playerImageFrameView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.7
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let frontDataView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1

        return view
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        label.layer.borderWidth = 1
        
        return label
    }()
    
    let roleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    let gameIdLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.layer.borderWidth = 1
        
        return label
    }()
    
    let backgroundDataTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
        tableView.separatorColor = .black
        tableView.layer.borderWidth = 1
        
        return tableView
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        updatePlayerDetail()
        addGestureEvent()
    }
    
    func configureUI() {
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        backgroundView.addSubview(containerView)
        containerView.addSubview(playerImageFrameView)
        containerView.addSubview(frontDataView)
        containerView.addSubview(backgroundDataTableView)
        playerImageFrameView.addSubview(playerImageView)
        frontDataView.addSubview(teamLabel)
        frontDataView.addSubview(roleLabel)
        frontDataView.addSubview(gameIdLabel)
        
        backgroundDataTableView.register(
            PlayerBackgroundDataTableViewCell.self,
            forCellReuseIdentifier: PlayerBackgroundDataTableViewCell.identifier
        )
        
        backgroundDataTableView.dataSource = self
        backgroundDataTableView.delegate = self
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        playerImageFrameView.translatesAutoresizingMaskIntoConstraints = false
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        frontDataView.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        gameIdLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundDataTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: view.frame.width * 2 / 3),
            containerView.heightAnchor.constraint(equalToConstant: 370),
            
            playerImageFrameView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            playerImageFrameView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerImageFrameView.widthAnchor.constraint(equalToConstant: 120),
            playerImageFrameView.heightAnchor.constraint(equalToConstant: 130),
            
            playerImageView.topAnchor.constraint(equalTo: playerImageFrameView.topAnchor, constant: 5),
            playerImageView.leftAnchor.constraint(equalTo: playerImageFrameView.leftAnchor),
            playerImageView.rightAnchor.constraint(equalTo: playerImageFrameView.rightAnchor),
            playerImageView.heightAnchor.constraint(equalToConstant: 120),
            
            frontDataView.topAnchor.constraint(equalTo: playerImageFrameView.bottomAnchor, constant: 5),
            frontDataView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            frontDataView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            frontDataView.heightAnchor.constraint(equalToConstant: 68),
            
            teamLabel.topAnchor.constraint(equalTo: frontDataView.topAnchor),
            teamLabel.leftAnchor.constraint(equalTo: frontDataView.leftAnchor),
            teamLabel.rightAnchor.constraint(equalTo: frontDataView.rightAnchor),
            teamLabel.heightAnchor.constraint(equalToConstant: 22),
            
            roleLabel.topAnchor.constraint(equalTo: teamLabel.bottomAnchor),
            roleLabel.leftAnchor.constraint(equalTo: frontDataView.leftAnchor),
            roleLabel.rightAnchor.constraint(equalTo: frontDataView.rightAnchor),
            roleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            gameIdLabel.topAnchor.constraint(equalTo: roleLabel.bottomAnchor),
            gameIdLabel.leftAnchor.constraint(equalTo: frontDataView.leftAnchor),
            gameIdLabel.rightAnchor.constraint(equalTo: frontDataView.rightAnchor),
            gameIdLabel.heightAnchor.constraint(equalToConstant: 22),
            
            backgroundDataTableView.topAnchor.constraint(equalTo: gameIdLabel.bottomAnchor),
            backgroundDataTableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            backgroundDataTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            backgroundDataTableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
        ])
    }
    
    func updatePlayerDetail() {
        playerImageView.image = UIImage(named: playerInfo!.imageString)
        teamLabel.text = playerInfo?.team
        roleLabel.text = playerInfo?.role
        gameIdLabel.text = playerInfo?.gameId
        
        backgroundDataTableView.reloadData()
    }
    
    func addGestureEvent() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(clickBackgroundView(_:))
        )
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func clickBackgroundView(_ sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PlayerDetailViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PlayerBackgroundDataTableViewCell.identifier,
            for: indexPath
        ) as? PlayerBackgroundDataTableViewCell else {
            return UITableViewCell()
        }
                
        cell.selectionStyle = .none
        cell.configureCell()
        
        let playerDetailDataType = PlayerDetailDataType(rawValue: indexPath.row)!
        switch playerDetailDataType {
        case .name:
            cell.categoryLabel.text = playerDetailDataType.category()
            cell.contentLabel.text = playerInfo?.name
        case .birth:
            cell.categoryLabel.text = playerDetailDataType.category()
            cell.contentLabel.text = playerInfo?.birth
        case .nationality:
            cell.categoryLabel.text = playerDetailDataType.category()
            cell.contentLabel.text = playerInfo?.nationality
        }
        
        return cell
    }
}

extension PlayerDetailViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt
        indexPath: IndexPath
    ) -> CGFloat {
        return 50
    }
}
