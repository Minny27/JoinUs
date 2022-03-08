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
    
    let playerDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.separatorColor = .black
        tableView.allowsSelection = false
        tableView.layer.borderWidth = 2
        tableView.layer.cornerRadius = 10
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupUI()
    }
    
    func setupNavigationController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(clickCancelButton)
        )
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(playerDetailTableView)
        playerDetailTableView.layer.borderColor = playerInfo?.teamColor.cgColor
        
        playerDetailTableView.register(
            PlayerImageCell.self,
            forCellReuseIdentifier: PlayerImageCell.identifier
        )
        
        playerDetailTableView.register(
            PlayerDetailCell.self,
            forCellReuseIdentifier: PlayerDetailCell.identifier
        )
        
        playerDetailTableView.dataSource = self
        playerDetailTableView.delegate = self
        
        playerDetailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        playerDetailTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        playerDetailTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        playerDetailTableView.heightAnchor.constraint(equalToConstant: 572).isActive = true

    }
    
    @objc func clickCancelButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension PlayerDetailViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 7
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let playerInfo = playerInfo else { return UITableViewCell() }
        
        let playerDetailDataType = PlayerDetailDataType(rawValue: indexPath.row)
        switch playerDetailDataType {
        case .image:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PlayerImageCell.identifier,
                for: indexPath
            ) as! PlayerImageCell
            
            cell.setupCell()
            cell.update(playerInfo: playerInfo)
            return cell
            
        case .none:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PlayerDetailCell.identifier,
                for: indexPath
            ) as! PlayerDetailCell
            cell.setupCell()
            
            let playerDetailCategoryType =  PlayerDetailCategoryType(rawValue: indexPath.row)!
            switch playerDetailCategoryType {
            case .image:
                break
            case .team:
                cell.update(
                    category: playerDetailCategoryType.category,
                    description: playerInfo.team,
                    teamColor: playerInfo.teamColor
                )
            case .role:
                cell.update(
                    category: playerDetailCategoryType.category,
                    description: playerInfo.role,
                    teamColor: playerInfo.teamColor
                )
            case .nickName:
                cell.update(
                    category: playerDetailCategoryType.category,
                    description: playerInfo.gameId,
                    teamColor: playerInfo.teamColor
                )
            case .name:
                cell.update(
                    category: playerDetailCategoryType.category,
                    description: playerInfo.name,
                    teamColor: playerInfo.teamColor
                )
            case .birth:
                cell.update(
                    category: playerDetailCategoryType.category,
                    description: playerInfo.birth,
                    teamColor: playerInfo.teamColor
                )
            case .nationality:
                cell.update(
                    category: playerDetailCategoryType.category,
                    description: playerInfo.nationality,
                    teamColor: playerInfo.teamColor
                )
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension PlayerDetailViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt
        indexPath: IndexPath
    ) -> CGFloat {
        let playerDetailDataType = PlayerDetailDataType(rawValue: indexPath.row)
        switch playerDetailDataType {
        case .image:
            return 250
        case .none:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
