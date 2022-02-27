//
//  PlayerTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/21.
//

import UIKit

final class TeamPlayerCollectionViewCell: UICollectionViewCell {
    static let identifier = "TeamPlayerPageViewCell"
    
    var playerList = [Player]()
    
    let teamPlayerCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 20

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowlayout
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupCell() {
        contentView.addSubview(teamPlayerCollectionView)
        
        teamPlayerCollectionView.register(
            PlayerCollectionViewCell.self,
            forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier
        )
        
        teamPlayerCollectionView.dataSource = self
        teamPlayerCollectionView.delegate = self
        
        teamPlayerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        teamPlayerCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        teamPlayerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        teamPlayerCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        if playerList.count > 0 {
            teamPlayerCollectionView.reloadData()
        }
    }
}

extension TeamPlayerCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PlayerCollectionViewCell.identifier,
            for: indexPath
        ) as! PlayerCollectionViewCell
                
        let playerInfo = playerList[indexPath.row]
        
        cell.update(playerInfo: playerInfo)
        return cell
    }
}

extension TeamPlayerCollectionViewCell: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension TeamPlayerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: (teamPlayerCollectionView.frame.width - 40) / 3, height: 131)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
