//
//  PlayerSearchViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/07.
//

import Foundation
import UIKit

class PlayerSearchViewController: UIViewController {
    
    // MARK: - Properties
    let playerCollectionViewModel = PlayerCollectionViewModel()
    let playerSearchController = UISearchController(searchResultsController: nil)
    var filteredPlayers: [PlayerModel] = []
    var isFiltering: Bool {
        return playerSearchController.isActive && !isTextEmpty
    }
    var isTextEmpty: Bool {
        return playerSearchController.searchBar.text?.isEmpty ?? true
    }
    
    let playerTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(
            top: 0,
            left: 10,
            bottom: 0,
            right: 10
        )
        
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureSearchController()
        configureTableView()
    }
    
    func configureSearchController() {
        playerSearchController.searchBar.placeholder = "선수를 검색해보세요"
        playerSearchController.hidesNavigationBarDuringPresentation = false
        playerSearchController.searchResultsUpdater = self
        definesPresentationContext = true
        
        navigationController?.navigationBar.tintColor = .lightGray
        navigationItem.searchController = playerSearchController
        navigationItem.title = "Search"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(clickBackButton)
        )
        
        playerSearchController.searchBar.barStyle = .default
        playerSearchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        playerSearchController.searchBar.frame = playerSearchController.searchBar.bounds
        playerSearchController.searchBar.autoresizingMask = [.flexibleWidth]
        playerSearchController.searchBar.tintColor = .systemTeal
    }
    
    func configureTableView() {
        view.backgroundColor = .white
        
        view.addSubview(playerTableView)
        
        playerTableView.register(
            PlayerTableViewCell.self,
            forCellReuseIdentifier: PlayerTableViewCell.identifier
        )
        
        playerTableView.dataSource = self
        playerTableView.delegate = self
        
        playerTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playerTableView.topAnchor.constraint(equalTo: view.topAnchor),
            playerTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            playerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    @objc func clickBackButton() {
        dismiss(
            animated: false,
            completion: nil
        )
    }
}

extension PlayerSearchViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if isFiltering {
            return filteredPlayers.count
        }
        
        return playerCollectionViewModel.countPlayerList
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PlayerTableViewCell.identifier,
            for: indexPath
        ) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        
        var playerInfo: PlayerModel
        
        if isFiltering {
            playerInfo = filteredPlayers[indexPath.row]
        } else {
            playerInfo = playerCollectionViewModel.playerInfo(at: indexPath.row)
        }
        
        cell.selectionStyle = .none
        cell.configureCell()
        cell.update(playerInfo: playerInfo)
        
        return cell
    }
}

extension PlayerSearchViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 90
    }
}

extension PlayerSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = playerSearchController.searchBar.text!
        filteredPlayers = playerCollectionViewModel.playerList.filter { (player: PlayerModel) -> Bool in
            return player.playerName.lowercased().contains(searchText.lowercased())
        }
        
        playerTableView.reloadData()
    }
}
