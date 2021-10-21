//
//  TeamTabbarTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/21.
//

import UIKit

class TeamTabbarTableViewCell: UITableViewCell {
    static let identifier = "teamTabbarTableViewCell"
    
    let teamTabbarCellWidth: [Int] = [80, 75, 50, 55, 55, 80, 75, 65, 50, 60]
    var isTeamAssigned: [Bool] = Array(repeating: false, count: 10)
    static var teamRow = 0

    let teamTabbarViewmodel = TeamTabbarViewModel()
    
    let teamTabbarCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        contentView.addSubview(teamTabbarCollectionView)
        
        teamTabbarCollectionView.register(TeamTabbarCollectionViewCell.self, forCellWithReuseIdentifier: TeamTabbarCollectionViewCell.identifier)
        
        teamTabbarCollectionView.dataSource = self
        teamTabbarCollectionView.delegate = self
        
        teamTabbarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamTabbarCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            teamTabbarCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            teamTabbarCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            teamTabbarCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}

extension TeamTabbarTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamTabbarCollectionViewCell.identifier, for: indexPath) as? TeamTabbarCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if !isTeamAssigned[indexPath.row] {
            isTeamAssigned[indexPath.row] = true
            
            cell.configureUI(cellIndex: indexPath.row, cellWidth: CGFloat(teamTabbarCellWidth[indexPath.row]))
        }
        
        let teamInfo = teamTabbarViewmodel.teamInfo(at: indexPath.row)
        cell.update(teamInfo: teamInfo)
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10
        
        return cell
    }
}

extension TeamTabbarTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == TeamTabbarTableViewCell.teamRow {
            return
        }
        
        TeamTabbarTableViewCell.teamRow = indexPath.row
        PlayerTableViewCell.playerCollectionView.reloadData()
    }
}

extension TeamTabbarTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: teamTabbarCellWidth[indexPath.row], height: 30)
    }
}
