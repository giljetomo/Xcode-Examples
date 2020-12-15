//
//  RedViewController.swift
//  TabBarControllerDemo
//
//  Created by Derrick Park on 2020-12-14.
//

import UIKit

class RedViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Red"
    view.backgroundColor = .red
    tabBarItem.badgeValue = "7℃"
    tabBarItem.badgeColor = .systemPink
    print("RedViewController - \(#function)")
  }
}
