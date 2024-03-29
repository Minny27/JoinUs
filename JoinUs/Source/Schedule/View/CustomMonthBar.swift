//
//  CustomMonthBar.swift
//  JoinUs
//
//  Created by SeungMin on 2022/02/14.
//

import UIKit

final class CustomMonthBar: UIView {
    
    // MARK: - Properties
    let monthCollectionViewModel = MonthCollectionViewModel()
    weak var customTabBarDelegate: CustomTabBarDelegate?
    
    var selectedMonthIndexPath = IndexPath(
        item: Int(DateFormatter().dateToString(date: Date(), dateFormat: .month))! - 1,
        section: 0
    )
    var indicatorViewLeftConstraint: NSLayoutConstraint!
    var indicatorViewWidthConstraint: NSLayoutConstraint!
    
    let monthCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowlayout
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
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCustomTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    func setupCollectionView() {
        monthCollectionView.register(
            MonthCollectionViewCell.self,
            forCellWithReuseIdentifier: MonthCollectionViewCell.identifier
        )
        
        monthCollectionView.dataSource = self
        monthCollectionView.delegate = self
    }
    
    func setupCustomTabBar() {
        setupCollectionView()
        addSubview(monthCollectionView)
        monthCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        monthCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        monthCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        monthCollectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        addSubview(indicatorView)
        indicatorViewLeftConstraint = indicatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 60 * CGFloat(selectedMonthIndexPath.row))
        indicatorViewLeftConstraint.isActive = true
        indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: 60)
        indicatorViewWidthConstraint.isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
}

// MARK: - UICollectionViewDataSource
extension CustomMonthBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monthCollectionViewModel.countMonthList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCollectionViewCell.identifier, for: indexPath) as! MonthCollectionViewCell
        
        let monthInfo = monthCollectionViewModel.monthInfo(at: indexPath.row)
        
        cell.setupCell()
        cell.update(monthInfo: monthInfo)
        return cell
    }
}

extension CustomMonthBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMonthIndexPath = indexPath
        customTabBarDelegate?.customTabBarIndex(scroll: selectedMonthIndexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let selectedCell = monthCollectionView.cellForItem(at: selectedMonthIndexPath)
        customTabBarDelegate?.pastScrollOffsetX(offsetX: scrollView.contentOffset.x)

        // 셀이 보일 경우, 선택된 월과 동일한 위치 유지
        if let selectedCell = selectedCell {
            indicatorViewLeftConstraint.constant = selectedCell.frame.minX - scrollView.contentOffset.x
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        customTabBarDelegate?.pastScrollOffsetX(offsetX: targetContentOffset.pointee.x)
    }
}

extension CustomMonthBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
