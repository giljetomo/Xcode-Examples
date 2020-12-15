//
//  ViewController.swift
//  Optionals
//
//  Created by Derrick Park on 12/9/20.
//

import UIKit

class ViewController: UIViewController {
  // 4. implicitly unwrapped optional
  @IBOutlet var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 2. unwrap safely using if-let
    if let image = imageView.image {
      print(image.size)
    }
    
    // 3. optional chaining
    if let size = imageView.image?.size {
      print(size)
    }
    
    // 1. force-unwrap
    var x: Int? = nil
    let forcedUnwrapped = x!
    print(forcedUnwrapped)
  }
}

