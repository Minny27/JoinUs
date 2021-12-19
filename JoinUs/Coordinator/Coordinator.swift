//
//  Coordinator.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/19.
//

import UIKit

class Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabbarController = TabBarController()
        tabbarController.overrideUserInterfaceStyle = .light
        
        window.rootViewController = tabbarController
        window.makeKeyAndVisible()
    }
}
