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

        // 상태 바에 배경색을 주기 위해 상태바 높이 구하기
        guard let statusBarHeight = window.windowScene?.statusBarManager?.statusBarFrame.height else {
            print("status bar 없음")
            return
        }
        tabbarController.setupStatusBarBackgroundView(statusBarHeight: statusBarHeight)
        
        window.rootViewController = tabbarController
        window.makeKeyAndVisible()
    }
}
