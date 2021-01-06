//
//  ViewController.swift
//  ScrollViewProgramatic
//
//  Created by Derrick Park on 2021-01-05.
//

import UIKit

class ViewController: UIViewController {

  let scrollView = UIScrollView()
  let imageView = UIImageView(image: UIImage(named: "landscape"))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(scrollView)
    scrollView.matchParent()
    
    scrollView.addSubview(imageView)
    imageView.anchors(topAnchor: scrollView.contentLayoutGuide.topAnchor, leadingAnchor: scrollView.contentLayoutGuide.leadingAnchor, trailingAnchor: scrollView.contentLayoutGuide.trailingAnchor, bottomAnchor: scrollView.contentLayoutGuide.bottomAnchor)
  }
}

