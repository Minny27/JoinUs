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
        
        setupTabBar()
    }
    
    func setupTabBar() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.isTranslucent = false
        
        view.backgroundColor = .white
        delegate = self
        
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

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTabBarTransition(viewControllers: tabBarController.viewControllers)
    }
    
}

class CustomTabBarTransition: NSObject, UIViewControllerAnimatedTransitioning {
    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 0.3
    
    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(transitionDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromViewController.view,
            let fromIndex = getIndex(fromViewController: fromViewController),
            let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toViewController.view,
            let toIndex = getIndex(fromViewController: toViewController) else {
                transitionContext.completeTransition(false)
                return
        }
        
        let frame = transitionContext.initialFrame(for: fromViewController)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart
        
        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(
                withDuration: self.transitionDuration,
                animations: {
                    fromView.frame = fromFrameEnd
                    toView.frame = frame
                },
                completion: { success in
                    fromView.removeFromSuperview()
                    transitionContext.completeTransition(success)
                }
            )
        }
    }
    
    func getIndex(fromViewController viewController: UIViewController) -> Int? {
        guard let viewControllers = self.viewControllers else { return nil }
        for (index, thisViewController) in viewControllers.enumerated() {
            if thisViewController == viewController { return index }
        }
        return nil
    }
}
