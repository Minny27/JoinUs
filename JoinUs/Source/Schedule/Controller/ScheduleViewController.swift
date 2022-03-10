//
//  ScheduleViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/15.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    // MARK: - Properties
    var lckMonthScheduleViewModel = LeagueScheduleTableViewModel(leagueType: .lck)
    var selectedMonthIndexPath = IndexPath(
        item: Int(DateFormatter().dateToString(date: Date(), dateFormat: .month))! - 1,
        section: 0
    )
    var pastScrollOffsetX: CGFloat = 0
    var IndicatorCenterXConstraint: NSLayoutConstraint!
    
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
    
    let customActivityIndicatorView = CustomActivityIndicatorView()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCustomTabBar()
        setupPageMonthCollectionView()
        setupLoadingView()
        fetchData()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "LCK 일정"
    }
    
    func setupCustomTabBar() {
        view.addSubview(customMonthBar)
        customMonthBar.customTabBarDelegate = self
        customMonthBar.translatesAutoresizingMaskIntoConstraints = false
        customMonthBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
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
        
        pageMonthCollectionView.scrollToItem(at: selectedMonthIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setupLoadingView() {
        pageMonthCollectionView.addSubview(customActivityIndicatorView)
        customActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        IndicatorCenterXConstraint = customActivityIndicatorView.centerXAnchor.constraint(equalTo: pageMonthCollectionView.centerXAnchor)
        IndicatorCenterXConstraint.isActive = true
        customActivityIndicatorView.centerYAnchor.constraint(equalTo: pageMonthCollectionView.centerYAnchor).isActive = true
        customActivityIndicatorView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        customActivityIndicatorView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func fetchData() {
        lckMonthScheduleViewModel.fetchMonthData()
        
        self.lckMonthScheduleViewModel.monthlyScheduleList.bind { _ in
            DispatchQueue.main.async {
                self.pageMonthCollectionView.reloadData()
                
                // 일정 페이지 뷰가 가져온 데이터를 바인딩 한 다음, 이번 달 데이터를 보여주기
                self.customMonthBar.monthCollectionView.selectItem(
                    at: self.selectedMonthIndexPath,
                    animated: true,
                    scrollPosition: .centeredHorizontally
                )
                
                self.pageMonthCollectionView.scrollToItem(
                    at: self.selectedMonthIndexPath,
                    at: .centeredHorizontally,
                    animated: true
                )
                
                self.IndicatorCenterXConstraint.constant = CGFloat(self.selectedMonthIndexPath.row) * (self.pageMonthCollectionView.frame.width + 12)
            }
        }
    }
    
    func clearData() {
        lckMonthScheduleViewModel = LeagueScheduleTableViewModel(leagueType: .lck)
        pageMonthCollectionView.reloadData()
    }
}

extension ScheduleViewController: CustomTabBarDelegate {
    func customTabBarIndex(scroll index: Int) {
        selectedMonthIndexPath = IndexPath(item: index, section: 0)
        customMonthBar.monthCollectionView.scrollToItem(at: selectedMonthIndexPath, at: .centeredHorizontally, animated: true)
        pageMonthCollectionView.scrollToItem(at: selectedMonthIndexPath, at: .centeredHorizontally, animated: true)
        IndicatorCenterXConstraint.constant = CGFloat(selectedMonthIndexPath.row) * (pageMonthCollectionView.frame.width + 12)
    }
    
    func pastScrollOffsetX(offsetX pastScrollOffsetX: CGFloat) {
        self.pastScrollOffsetX = pastScrollOffsetX
    }
}

extension ScheduleViewController: RefreshTableViewDelegate {
    func refetchData() {
        clearData()
        customActivityIndicatorView.loadingView.startAnimating()
        fetchData()
    }
}

extension ScheduleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let month = indexPath.row + 1
        
        if lckMonthScheduleViewModel.hasMonthData[month] {
            if lckMonthScheduleViewModel.monthlyScheduleList.value![month].count > 0 {
                customActivityIndicatorView.loadingView.stopAnimating()
            }
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SchedulePageCollectionViewCell.identifier,
                for: indexPath
            ) as! SchedulePageCollectionViewCell
            cell.refreshTableViewDelegate = self
            cell.lckMonthScheduleList = lckMonthScheduleViewModel.monthlyScheduleList.value![month]
            cell.setupMonthScheduleTableView()
            return cell
        }
                
        else {
            customActivityIndicatorView.loadingView.stopAnimating()
            
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
            pageMonthCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            customMonthBar.monthCollectionView.selectItem(
                at: nextIndexPath,
                animated: true,
                scrollPosition: .centeredHorizontally
            )
            selectedMonthIndexPath = nextIndexPath
            customMonthBar.selectedMonthIndexPath = selectedMonthIndexPath
            IndicatorCenterXConstraint.constant = CGFloat(self.selectedMonthIndexPath.row) * (self.pageMonthCollectionView.frame.width + 12)
        }

        else if selectedMonthIndexPath.row > 0 && CGFloat(selectedMonthIndexPath.row) > targetContentOffset.pointee.x / pageMonthCollectionView.frame.width {
            let pastIndexPath = IndexPath(item: selectedMonthIndexPath.row - 1, section: 0)
            pageMonthCollectionView.scrollToItem(at: pastIndexPath, at: .centeredHorizontally, animated: true)
            customMonthBar.monthCollectionView.selectItem(
                at: pastIndexPath,
                animated: true,
                scrollPosition: .centeredHorizontally
            )
            selectedMonthIndexPath = pastIndexPath
            customMonthBar.selectedMonthIndexPath = selectedMonthIndexPath
            IndicatorCenterXConstraint.constant = CGFloat(self.selectedMonthIndexPath.row) * (self.pageMonthCollectionView.frame.width + 12)
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
