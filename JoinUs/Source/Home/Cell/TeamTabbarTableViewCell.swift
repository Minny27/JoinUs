//
//  TeamTabbarTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/21.
//

import UIKit

final class TeamTabbarTableViewCell: UITableViewCell {
    static let identifier = "teamTabbarTableViewCell"
    
    let teamTabbarCellWidth: [Int] = [80, 75, 50, 55, 55, 80, 75, 65, 50, 60]
    static var teamType = TeamType.DK

    let teamTabbarViewmodel = TeamTabbarViewModel()
    
    let teamTabbarCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    func configureCell() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(teamTabbarCollectionView)
        
        teamTabbarCollectionView.register(
            TeamTabbarCollectionViewCell.self,
            forCellWithReuseIdentifier: TeamTabbarCollectionViewCell.identifier
        )
        
        teamTabbarCollectionView.dataSource = self
        teamTabbarCollectionView.delegate = self
        
        teamTabbarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamTabbarCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            teamTabbarCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            teamTabbarCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            teamTabbarCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
}

extension TeamTabbarTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 10
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamTabbarCollectionViewCell.identifier, for: indexPath) as? TeamTabbarCollectionViewCell else {
            return UICollectionViewCell()
        }

        let teamInfo = teamTabbarViewmodel.teamInfo(at: indexPath.row)
        
        cell.configureUI(cellIndex: indexPath.row, cellWidth: CGFloat(teamTabbarCellWidth[indexPath.row]))
        cell.update(teamInfo: teamInfo)
        
        return cell
    }
}

extension TeamTabbarTableViewCell: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        TeamTabbarTableViewCell.teamType = TeamType(rawValue: indexPath.row)!
        TeamPlayerTableViewCell.teamPlayerCollectionView.reloadData()
    }
}

extension TeamTabbarTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        return CGSize(width: teamTabbarCellWidth[indexPath.row], height: 40)
    }
}
