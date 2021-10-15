//
//  TabbarController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/13.
//

import UIKit

class TabbarController: UITabBarController {

    // MARK: - Properies
    let homeTab = HomeViewController()
    let scheduleTab = ScheduleViewController()
    let rankTab = RankViewController()
    let newsTab = NewsViewController()
    let playerTab = PlayerViewController()
    
    let homeTabItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), selectedImage: UIImage(systemName: "homekit"))
    let scheduleTabItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendar"))
    let rankingTabItem = UITabBarItem(title: "Rank", image: UIImage(systemName: "crown"), selectedImage: UIImage(systemName: "crown"))
    let newsTabItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper"))
    let playerTabItem = UITabBarItem(title: "Player", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

        self.viewControllers = [homeTab, scheduleTab, rankTab, newsTab, playerTab]
    }
    
    func configureUI() {
        homeTab.tabBarItem = homeTabItem
        scheduleTab.tabBarItem = scheduleTabItem
        rankTab.tabBarItem = rankingTabItem
        newsTab.tabBarItem = newsTabItem
        playerTab.tabBarItem = playerTabItem
    }
}
