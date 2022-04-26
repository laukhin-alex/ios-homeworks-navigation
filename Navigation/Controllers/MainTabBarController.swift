//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Александр on 12.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }

    func setupTabBar() {
        let feedViewController = createNavController(viewController: FeedViewController(), itemName: "Feed", ItemImage: "house")
        let logInViewController = createNavController(viewController: LogInViewController(), itemName: "Profile", ItemImage: "person.crop.circle")
        viewControllers = [feedViewController, logInViewController]
    }

    func createNavController(viewController: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))  ,tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }
}
