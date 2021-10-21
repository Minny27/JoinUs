//
//  PlayerTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/21.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    static let identifier = "playerTableViewCell"
    
    let playerCollectionViewModel = PlayerCollectionViewModel()
    
    static let playerCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.layer.borderWidth = 2
        collectionView.layer.cornerRadius = 10
        collectionView.layer.borderColor = UIColor.systemGray3.cgColor
        
        return collectionView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell() {
        contentView.addSubview(PlayerTableViewCell.playerCollectionView)
        
        PlayerTableViewCell.playerCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        
        PlayerTableViewCell.playerCollectionView.dataSource = self
        PlayerTableViewCell.playerCollectionView.delegate = self
        
        PlayerTableViewCell.playerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            PlayerTableViewCell.playerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            PlayerTableViewCell.playerCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            PlayerTableViewCell.playerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            PlayerTableViewCell.playerCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}

extension PlayerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as? PlayerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 1:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 2:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 3:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 4:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 5:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 6:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 7:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 8:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        case 9:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        default:
            cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamRow][indexPath.row])
        }
        
        return cell
    }
}

extension PlayerTableViewCell: UICollectionViewDelegate {
    
}

extension PlayerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 40) / 3, height: 120)
    }
}
