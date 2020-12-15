//
//  MainTabBarController.swift
//  TabBarControllerDemo
//
//  Created by Derrick Park on 2020-12-14.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let redNVC = embedInNavController(RedViewController(), systemItem: .bookmarks, tag: 0)

    let blueNVC = embedInNavController(BlueViewController(), systemItem: .downloads, tag: 1)
    
    let greenNVC = embedInNavController(GreenViewController(), systemItem: .recents, tag: 2)
    
    let purpleNVC = embedInNavController(PurpleViewController(), systemItem: .history, tag: 3)
          
    let yellowNVC = embedInNavController(YellowViewController(), systemItem: .search, tag: 4)
     
    viewControllers = [redNVC, blueNVC, greenNVC, purpleNVC, yellowNVC]
  }
  
  private func embedInNavController(_ viewController: UIViewController, systemItem: UITabBarItem.SystemItem, tag: Int) -> UINavigationController {
    viewController.tabBarItem = UITabBarItem(tabBarSystemItem: systemItem, tag: tag)
    return UINavigationController(rootViewController: viewController)
  }
  
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    if item.badgeValue != nil {
      item.badgeValue = nil
    } else {
      item.badgeValue = "🤩"
    }
    print(item.badgeValue ?? "")
  }
}
