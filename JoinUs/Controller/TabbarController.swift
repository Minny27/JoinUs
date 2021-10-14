//
//  TabbarController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/13.
//

import UIKit

class TabbarController: UITabBarController {

    // MARK: - Properies
    let tabOne = HomeViewController()
    let tabOneItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "homekit"), selectedImage: UIImage(systemName: "homekit"))
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

        self.viewControllers = [tabOne]
    }
    
    func configureUI() {
        tabOne.tabBarItem = tabOneItem
    }
}
