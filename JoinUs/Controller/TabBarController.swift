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
    let standingsTab = StandingsViewController()
    let newsTab = NewsViewController()
    let playerTab = PlayerViewController()
    
    let homeTabItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
    let scheduleTabItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendar"))
    let standingsTabItem = UITabBarItem(title: "Rank", image: UIImage(systemName: "crown"), selectedImage: UIImage(systemName: "crown"))
    let newsTabItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper"))
    let playerTabItem = UITabBarItem(title: "Player", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

        self.viewControllers = [homeTab, scheduleTab, standingsTab, newsTab, playerTab]
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        homeTab.tabBarItem = homeTabItem
        scheduleTab.tabBarItem = scheduleTabItem
        standingsTab.tabBarItem = standingsTabItem
        newsTab.tabBarItem = newsTabItem
        playerTab.tabBarItem = playerTabItem
    }
}
