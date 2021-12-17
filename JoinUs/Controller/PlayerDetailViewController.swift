//
//  PlayerDetailViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/13.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    
    // MARK: - Properties
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        
        return view
    }()
    
    let playerDetailViewModel = PlayerDetailViewModel()
    
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
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.layer.borderWidth = 1
        
        return label
    }()
    
    let roleContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let roleImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let roleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    }()
    
    let gameIdLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.layer.borderWidth = 1
        
        return label
    }()
    
    let backgroundDataTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = .black
        tableView.layer.borderWidth = 1
        
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addGestureEvent()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(clickPlayerTableViewCellNotification(_:)),
            name: Notification.Name(Strings.clickPlayerTableViewCellNotification),
            object: nil
        )
        
        playerDetailViewModel.playerDetail.bind { playerDetail in
            DispatchQueue.main.async {
                if playerDetail != nil {
                    self.playerImageView.image = UIImage(named: playerDetail!.imageString)
                    self.teamLabel.text = playerDetail?.team
                    self.roleImageView.image = UIImage(data: playerDetail!.roleImageData)
                    self.roleLabel.text = playerDetail?.role
                    self.gameIdLabel.text = playerDetail?.gameId
                }
                
                self.backgroundDataTableView.reloadData()
            }
        }
        
        playerDetailViewModel.fetchData(urlString: "https://namu.wiki/w/%EA%B9%80%EA%B1%B4%EB%B6%80")
//        CrawlManager().crawlPlayerDetail(urlString: "https://namu.wiki/w/%EA%B9%80%EA%B1%B4%EB%B6%80")
    }
    
    func configureUI() {
        
        view.addSubview(backgroundView)
        backgroundView.addSubview(containerView)
        containerView.addSubview(playerImageFrameView)
        containerView.addSubview(frontDataView)
        containerView.addSubview(backgroundDataTableView)
        playerImageFrameView.addSubview(playerImageView)
        frontDataView.addSubview(teamLabel)
        frontDataView.addSubview(roleContainerView)
        frontDataView.addSubview(gameIdLabel)
        roleContainerView.addSubview(roleImageView)
        roleContainerView.addSubview(roleLabel)
        
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
        roleContainerView.translatesAutoresizingMaskIntoConstraints = false
        roleImageView.translatesAutoresizingMaskIntoConstraints = false
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
            
            roleContainerView.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 2),
            roleContainerView.centerXAnchor.constraint(equalTo: frontDataView.centerXAnchor),
            roleContainerView.widthAnchor.constraint(equalToConstant: 70 ),
            roleContainerView.heightAnchor.constraint(equalToConstant: 20),
            
            roleImageView.topAnchor.constraint(equalTo: roleContainerView.topAnchor),
            roleImageView.leftAnchor.constraint(equalTo: roleContainerView.leftAnchor),
            roleImageView.bottomAnchor.constraint(equalTo: roleContainerView.bottomAnchor),
            roleImageView.widthAnchor.constraint(equalToConstant: 20),
            
            roleLabel.topAnchor.constraint(equalTo: roleContainerView.topAnchor),
            roleLabel.leftAnchor.constraint(equalTo: roleImageView.rightAnchor, constant: 5),
            roleLabel.rightAnchor.constraint(equalTo: roleContainerView.rightAnchor),
            roleLabel.bottomAnchor.constraint(equalTo: roleContainerView.bottomAnchor),
            
            gameIdLabel.topAnchor.constraint(equalTo: roleContainerView.bottomAnchor),
            gameIdLabel.leftAnchor.constraint(equalTo: frontDataView.leftAnchor),
            gameIdLabel.rightAnchor.constraint(equalTo: frontDataView.rightAnchor),
            gameIdLabel.heightAnchor.constraint(equalToConstant: 22),
            
            backgroundDataTableView.topAnchor.constraint(equalTo: gameIdLabel.bottomAnchor),
            backgroundDataTableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            backgroundDataTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            backgroundDataTableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
        ])
    }
    
    func addGestureEvent() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(clickBackgroundView(_:))
        )
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func clickBackgroundView(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false, completion: nil)
    }
    
    @objc func clickPlayerTableViewCellNotification(_ notification: NSNotification) {
        let namePathVariable = notification.userInfo!["namePathVariable"]! as! String
        playerDetailViewModel.fetchData(urlString: Strings.wikiBaseUrl + namePathVariable)
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
            cell.contentLabel.text = playerDetailViewModel.playerDetail.value?.name
        case .birth:
            cell.categoryLabel.text = playerDetailDataType.category()
            cell.contentLabel.text = playerDetailViewModel.playerDetail.value?.birth
        case .nationality:
            cell.categoryLabel.text = playerDetailDataType.category()
            cell.contentLabel.text = playerDetailViewModel.playerDetail.value?.nationality
        }
        
        return cell
    }
}

extension PlayerDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
