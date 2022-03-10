//
//  PopUpViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/30.
//

import UIKit

class SeasonSectionViewController: UIViewController {
    
    // MARK: - Properies
    let seasonCollectionViewModel = SeasonCollectionViewModel()
    weak var selectionSeasonDelegate: SelectionSeasonDelegate?
    
    let seasonSectionTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderHeight = 0
        } else {
            // Fallback on earlier versions
        }
        return tableView
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSeasonSelectionTableView()
    }
    
    func setupSeasonSelectionTableView() {
        view.addSubview(seasonSectionTableView)
        
        seasonSectionTableView.register(
            SeasonSelectionTableViewCell.self,
            forCellReuseIdentifier: SeasonSelectionTableViewCell.identifier
        )
        
        seasonSectionTableView.dataSource = self
        seasonSectionTableView.delegate = self
        
        seasonSectionTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        seasonSectionTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        seasonSectionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        seasonSectionTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
}

extension SeasonSectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonCollectionViewModel.countSeasonList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SeasonSelectionTableViewCell.identifier,
            for: indexPath
        ) as! SeasonSelectionTableViewCell
        
        let seasonInfo = seasonCollectionViewModel.seasonInfo(at: indexPath.row)
        
        cell.selectionStyle = .none
        cell.setupCell()
        cell.update(year: seasonInfo.year, season: seasonInfo.season)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension SeasonSectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = true
        
        let seasonInfo = seasonCollectionViewModel.seasonInfo(at: indexPath.row)
        
        RequestSeason.year = seasonInfo.year
        RequestSeason.season = seasonInfo.season
        selectionSeasonDelegate?.selectionSeason()
        
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isHighlighted = true
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isHighlighted = false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
