//
//  TeamTabbarTableViewCell.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/21.
//

import UIKit

final class TeamPlayerPagerView: UITableViewCell {
    static let identifier = "TeamPlayerPagerView"

    let teamPlayerPageCollectionViewModel = TeamPlayerPageCollectionViewModel()
    var selectedTeamIndexPath = IndexPath(item: 0, section: 0)
    var pastScrollOffsetX: CGFloat = 0
    
    let customTeamBar = CustomTeamBar()
    
    let teamPlayerPageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupCustomTeamBar() {
        contentView.addSubview(customTeamBar)
        customTeamBar.customTabBarDelegate = self
        customTeamBar.translatesAutoresizingMaskIntoConstraints = false
        customTeamBar.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        customTeamBar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        customTeamBar.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        customTeamBar.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupTeamPlayerPageCollectionView() {
        contentView.addSubview(teamPlayerPageCollectionView)
        
        teamPlayerPageCollectionView.register(
            TeamPlayerCollectionViewCell.self,
            forCellWithReuseIdentifier: TeamPlayerCollectionViewCell.identifier
        )
        
        teamPlayerPageCollectionView.dataSource = self
        teamPlayerPageCollectionView.delegate = self
        
        teamPlayerPageCollectionView.topAnchor.constraint(
            equalTo: customTeamBar.bottomAnchor,
            constant: 10
        ).isActive = true
        teamPlayerPageCollectionView.leftAnchor.constraint(
            equalTo: contentView.leftAnchor,
            constant: 16
        ).isActive = true
        teamPlayerPageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        teamPlayerPageCollectionView.rightAnchor.constraint(
            equalTo: contentView.rightAnchor,
            constant: -16
        ).isActive = true
    }
    
    func setupUI() {
        setupCustomTeamBar()
        setupTeamPlayerPageCollectionView()
    }
}

extension TeamPlayerPagerView: CustomTabBarDelegate {
    func customTabBarIndex(scroll index: Int) {
        selectedTeamIndexPath = IndexPath(item: index, section: 0)
        customTeamBar.teamBarCollectionView.scrollToItem(
            at: selectedTeamIndexPath,
            at: .centeredHorizontally,
            animated: true
        )
        teamPlayerPageCollectionView.scrollToItem(
            at: selectedTeamIndexPath,
            at: .centeredHorizontally,
            animated: true
        )
    }
    
    func pastScrollOffsetX(offsetX pastScrollOffsetX: CGFloat) {
        self.pastScrollOffsetX = pastScrollOffsetX
    }
}

extension TeamPlayerPagerView: UICollectionViewDataSource {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamPlayerCollectionViewCell.identifier, for: indexPath) as! TeamPlayerCollectionViewCell
        
        let teamPlayerListInfo = teamPlayerPageCollectionViewModel.teamPlayerList[indexPath.row]
        
        cell.playerList = teamPlayerListInfo
        cell.setupCell()
        return cell
        
    }
}

extension TeamPlayerPagerView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let selectedCell = customTeamBar.teamBarCollectionView.cellForItem(at: selectedTeamIndexPath) {
            customTeamBar.indicatorViewLaftConstraint.constant = selectedCell.frame.minX - pastScrollOffsetX
            customTeamBar.indicatorViewWidthConstraint.constant = selectedCell.frame.width
        }

        else {
            print("선택된 셀이 없습니다!")
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        teamPlayerPageCollectionView.selectItem(
            at: selectedTeamIndexPath,
            animated: true,
            scrollPosition: .centeredHorizontally
        )
        
        if selectedTeamIndexPath.row < 9 && CGFloat(selectedTeamIndexPath.row) < targetContentOffset.pointee.x / teamPlayerPageCollectionView.frame.width {
            let nextIndexPath = IndexPath(item: selectedTeamIndexPath.row + 1, section: 0)
            customTeamBar.teamBarCollectionView.selectItem(
                at: nextIndexPath,
                animated: true,
                scrollPosition: .centeredHorizontally
            )
            teamPlayerPageCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            selectedTeamIndexPath = nextIndexPath
            customTeamBar.selectedTeamIndexPath = selectedTeamIndexPath
        }
        
        else if selectedTeamIndexPath.row > 0 && CGFloat(selectedTeamIndexPath.row) > targetContentOffset.pointee.x / teamPlayerPageCollectionView.frame.width {
            let pastIndexPath = IndexPath(item: selectedTeamIndexPath.row - 1, section: 0)
            customTeamBar.teamBarCollectionView.selectItem(
                at: pastIndexPath,
                animated: true,
                scrollPosition: .centeredHorizontally
            )
            teamPlayerPageCollectionView.scrollToItem(at: pastIndexPath, at: .centeredHorizontally, animated: true)
            selectedTeamIndexPath = pastIndexPath
            customTeamBar.selectedTeamIndexPath = selectedTeamIndexPath
        }
        
        else {
            print("그 이외의 경우의 수")
        }
    }
}

extension TeamPlayerPagerView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: teamPlayerPageCollectionView.frame.width,
            height: teamPlayerPageCollectionView.frame.height
        )
    }
}
