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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        contentView.addSubview(PlayerTableViewCell.playerCollectionView)
        
        PlayerTableViewCell.playerCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        
        PlayerTableViewCell.playerCollectionView.dataSource = self
        PlayerTableViewCell.playerCollectionView.delegate = self
        
        PlayerTableViewCell.playerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            PlayerTableViewCell.playerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            PlayerTableViewCell.playerCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            PlayerTableViewCell.playerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            PlayerTableViewCell.playerCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -10)
        ])
    }
}

extension PlayerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamType.rawValue].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as? PlayerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.update(playerInfo: playerCollectionViewModel.teamPlayerList[TeamTabbarTableViewCell.teamType.rawValue][indexPath.row])
        
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
