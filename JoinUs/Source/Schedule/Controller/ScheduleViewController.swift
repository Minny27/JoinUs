//
//  ScheduleViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit
import RxSwift

class ScheduleViewController: UIViewController {
    
    // MARK: - Properties
    let lckMonthScheduleViewModel = LeagueScheduleTableViewModel(leagueType: .lck)
    var selectedMonthIndexPath = IndexPath(
        item: Int(DateFormatter().dateToString(date: Date(), dateFormat: .month))! - 1,
        section: 0
    )
    var pastScrollOffsetX: CGFloat = 0
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "✪ LCK 일정"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let customMonthBar = CustomMonthBar()
    
    let pageMonthCollectionView: UICollectionView = {
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
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupTitle()
        setupCustomTabBar()
        setupPageMonthCollectionView()
        
        lckMonthScheduleViewModel.fetchMonthData()
        
        self.lckMonthScheduleViewModel.monthlyScheduleList.bind { _ in
            DispatchQueue.main.async {
                self.pageMonthCollectionView.reloadData()
                
                self.pageMonthCollectionView.scrollToItem(
                    at: self.selectedMonthIndexPath,
                    at: .centeredHorizontally,
                    animated: true
                )
            }
        }
    }
        
    func setupTitle() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupCustomTabBar() {
        view.addSubview(customMonthBar)
        customMonthBar.customMonthBarDelegate = self
        customMonthBar.customPastScrollOffsetXDeleagte = self
        customMonthBar.translatesAutoresizingMaskIntoConstraints = false
        customMonthBar.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        customMonthBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        customMonthBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        customMonthBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupPageMonthCollectionView() {
        view.addSubview(pageMonthCollectionView)
        
        pageMonthCollectionView.register(
            SchedulePageCollectionViewCell.self,
            forCellWithReuseIdentifier: SchedulePageCollectionViewCell.identifier
        )
        
        pageMonthCollectionView.register(
            NoMonthScheduleCollectionViewCell.self,
            forCellWithReuseIdentifier: NoMonthScheduleCollectionViewCell.identifier
        )
        
        pageMonthCollectionView.dataSource = self
        pageMonthCollectionView.delegate = self
        
        pageMonthCollectionView.topAnchor.constraint(equalTo: customMonthBar.bottomAnchor).isActive = true
        pageMonthCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        pageMonthCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pageMonthCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
}

extension ScheduleViewController: CustomMonthBarDelegate {
    func customMonthBar(scroll index: Int) {
        selectedMonthIndexPath = IndexPath(item: index, section: 0)
        customMonthBar.monthCollectionView.scrollToItem(at: selectedMonthIndexPath, at: .centeredHorizontally, animated: true)
        pageMonthCollectionView.scrollToItem(at: selectedMonthIndexPath, at: .centeredHorizontally, animated: true)
    }
}

extension ScheduleViewController: CustomPastScrollOffsetXDelegate {
    func customPastScrollOffsetXD(offsetX pastScrollOffsetX: CGFloat) {
        self.pastScrollOffsetX = pastScrollOffsetX
    }
}

extension ScheduleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if lckMonthScheduleViewModel.hasMonthData[indexPath.row + 1] {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SchedulePageCollectionViewCell.identifier,
                for: indexPath
            ) as! SchedulePageCollectionViewCell
            cell.lckMonthScheduleList = lckMonthScheduleViewModel.monthlyScheduleList.value![indexPath.row + 1]
            cell.setupMonthScheduleTableView()
            return cell
        }
                
        else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NoMonthScheduleCollectionViewCell.identifier,
                for: indexPath
            ) as! NoMonthScheduleCollectionViewCell
            cell.setupCell()
            return cell
        }
    }
}

extension ScheduleViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let selectedX = 60 * CGFloat(selectedMonthIndexPath.row) - pastScrollOffsetX
        customMonthBar.indicatorViewLeftConstraint.constant = selectedX
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pageMonthCollectionView.selectItem(at: selectedMonthIndexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        if selectedMonthIndexPath.row < 11 && CGFloat(selectedMonthIndexPath.row) < targetContentOffset.pointee.x / pageMonthCollectionView.frame.width {
            let nextIndexPath = IndexPath(item: selectedMonthIndexPath.row + 1, section: 0)
            customMonthBar.monthCollectionView.selectItem(
                at: nextIndexPath,
                animated: true,
                scrollPosition: .centeredHorizontally
            )
            pageMonthCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            selectedMonthIndexPath = nextIndexPath
            customMonthBar.selectedMonthIndexPath = selectedMonthIndexPath
        }

        else if selectedMonthIndexPath.row > 0 && CGFloat(selectedMonthIndexPath.row) > targetContentOffset.pointee.x / pageMonthCollectionView.frame.width {
            let pastIndexPath = IndexPath(item: selectedMonthIndexPath.row - 1, section: 0)
            customMonthBar.monthCollectionView.selectItem(
                at: pastIndexPath,
                animated: true,
                scrollPosition: .centeredHorizontally
            )
            pageMonthCollectionView.scrollToItem(at: pastIndexPath, at: .centeredHorizontally, animated: true)
            selectedMonthIndexPath = pastIndexPath
            customMonthBar.selectedMonthIndexPath = selectedMonthIndexPath
        }
    }
}

extension ScheduleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: pageMonthCollectionView.frame.width, height: pageMonthCollectionView.frame.height)
    }
}
