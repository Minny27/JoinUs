//
//  CustomTeamBar.swift
//  JoinUs
//
//  Created by SeungMin on 2022/02/27.
//

import UIKit

final class CustomTeamBar: UIView {
    
    let teamBarViewmodel = TeamTabbarViewModel()
    let teamBarCellWidth = [55, 60, 85, 70, 60, 75, 60, 55, 85, 85]
    
    var customTabBarDelegate: CustomTabBarDelegate?
    var selectedTeamIndexPath = IndexPath(item: 0, section: 0)
    var indicatorViewLaftConstraint: NSLayoutConstraint!
    var indicatorViewWidthConstraint: NSLayoutConstraint!
    
    let teamBarCollectionView: UICollectionView = {
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
    
    let indicatorView: UIView = {
       let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCustomTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTeamBarCollectionView() {
        teamBarCollectionView.register(
            TeamBarCollectionViewCell.self,
            forCellWithReuseIdentifier: TeamBarCollectionViewCell.identifier
        )
        
        teamBarCollectionView.dataSource = self
        teamBarCollectionView.delegate = self
    }
    
    func setupCustomTabBar() {
        setupTeamBarCollectionView()
        
        addSubview(teamBarCollectionView)
        teamBarCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        teamBarCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        teamBarCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        teamBarCollectionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(indicatorView)
        indicatorViewLaftConstraint = indicatorView.leftAnchor.constraint(equalTo: leftAnchor)
        indicatorViewLaftConstraint.isActive = true
        indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: CGFloat(teamBarCellWidth[0]))
        indicatorViewWidthConstraint.isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
}

extension CustomTeamBar: UICollectionViewDataSource {
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamBarCollectionViewCell.identifier, for: indexPath) as? TeamBarCollectionViewCell else {
            return UICollectionViewCell()
        }

        let teamInfo = teamBarViewmodel.teamInfo(at: indexPath.row)
        
        cell.update(teamInfo: teamInfo)
        return cell
    }
}

extension CustomTeamBar: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedTeamIndexPath = indexPath
        customTabBarDelegate?.customTabBarIndex(scroll: selectedTeamIndexPath.row)
        TeamPlayerCollectionViewCell.selectedTeamIndex = indexPath.row
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let selectedCell = teamBarCollectionView.cellForItem(at: selectedTeamIndexPath)
        customTabBarDelegate?.pastScrollOffsetX(offsetX: scrollView.contentOffset.x)
        
        if let selectedCell = selectedCell {
            indicatorViewLaftConstraint.constant = selectedCell.frame.minX - scrollView.contentOffset.x
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        customTabBarDelegate?.pastScrollOffsetX(offsetX: targetContentOffset.pointee.x)
    }
}

extension CustomTeamBar: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: teamBarCellWidth[indexPath.row], height: 30)
    }
}
