//
//  main.swift
//  SwiftBasics
//
//  Created by Derrick Park on 12/9/20.
//

import Foundation

class Animal {
  var name: String
  init(name: String) {
    self.name = name
  }
}

class Dog: Animal {
  func bark() {
    print("Bark!")
  }
}

class Cat: Animal {
  func scratch() {
    print("Scratch!")
  }
}

func getPet(name: String) -> Animal {
  if name == "Dog" {
    return Dog(name: "Koro")
  } else {
    return Cat(name: "Doraemon")
  }
}

let pet: Animal = getPet(name: "Dog")
// Type Cast
if let dog = pet as? Dog {
  dog.bark()
} else if pet is Cat {
  let cat = pet as! Cat
  cat.scratch()
}

// Do Not Use Any in your own API (Code)
var items: [Any] = [5, "Bill", 6.7, Dog(name: "Rex")]
var objects: [AnyObject] = [Dog(name: "Pochi"), Cat(name: "Tama")]

// Swift (Any) <-> Objective-C (id)

func fetchPhotos(urlString: String) -> String? {
  guard let url = URL(string: urlString) else {
    // failed!
    return nil
  }
  print(url)
  
  // Your logic using url
  return url.absoluteString
}

func fetchPhotos2(urlString: String) {
  if let url = URL(string: urlString) {
    print(url)
    // Your logic using url
    
    
    
  } else {
    return
  }
}

struct Student {
  let id: String
  let name: String
}

func getStudentWith(id: String, name: String) -> Student {
  // Database
  // SELECT * FROM Student WHERE id == 123;
  let studentFetched: [Student] = [Student(id: "123", name: "")]
  assert(studentFetched.count == 1)
  return studentFetched.first!
}

class ViewController {
  
  // immediately invoked function ( closure )
  // iife - in JS
  let mainView: String = { () -> String in
    let v = String()
    // configuration code
    return v
  }()
  
  var fn: () -> String = {
    let v = String()
    return v
  }
  
  func viewDidLoad() {
    let s = fn()
    print(s)
  }
  
  var mainView1: String {
    return "Hello"
  }
  
}
