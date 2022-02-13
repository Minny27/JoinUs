//
//  PlayerTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/21.
//

import UIKit

final class TeamPlayerTableViewCell: UITableViewCell {
    static let identifier = "playerTableViewCell"
    
    let playerCollectionViewModel = TeamPlayerCollectionViewModel()
    
    static let teamPlayerCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.backgroundColor = .white
        collectionView.layer.borderWidth = 2
        collectionView.layer.cornerRadius = 10
        collectionView.layer.borderColor = UIColor.systemGray3.cgColor
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    func configureCell() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(TeamPlayerTableViewCell.teamPlayerCollectionView)
        
        TeamPlayerTableViewCell.teamPlayerCollectionView.register(
            TeamPlayerCollectionViewCell.self,
            forCellWithReuseIdentifier: TeamPlayerCollectionViewCell.identifier
        )
        
        TeamPlayerTableViewCell.teamPlayerCollectionView.dataSource = self
        TeamPlayerTableViewCell.teamPlayerCollectionView.delegate = self
        
        TeamPlayerTableViewCell.teamPlayerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            TeamPlayerTableViewCell.teamPlayerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            TeamPlayerTableViewCell.teamPlayerCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            TeamPlayerTableViewCell.teamPlayerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            TeamPlayerTableViewCell.teamPlayerCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -16)
        ])
    }
}

extension TeamPlayerTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return playerCollectionViewModel.countTeamPlayerList(at: TeamTabbarTableViewCell.teamType.rawValue)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamPlayerCollectionViewCell.identifier, for: indexPath) as? TeamPlayerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let playerInfo = playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamType.rawValue][indexPath.row]
        
        cell.update(playerInfo: playerInfo)
        
        return cell
    }
}

extension TeamPlayerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width) / 3, height: 120)
    }
}
