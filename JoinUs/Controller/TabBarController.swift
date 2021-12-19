//
//  TabbarController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/13.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.isTranslucent = false
        
        view.backgroundColor = .white
        self.viewControllers = [
            createTabBarItem(title: "Home", image: "house", viewController: HomeViewController()),
            createTabBarItem(title: "Schedule", image: "calendar", viewController: ScheduleViewController()),
            createTabBarItem(title: "Rank", image: "crown", viewController: StandingsViewController()),
            createTabBarItem(title: "News", image: "newspaper", viewController: NewsViewController()),
            createTabBarItem(title: "Player", image: "person", viewController: PlayerViewController()),
        ]
    }
    
    func createTabBarItem(
        title: String,
        image: String,
        viewController: UIViewController
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: image)
        navigationController.isNavigationBarHidden = true
        navigationController.isToolbarHidden = true
        
        return navigationController
    }
}
