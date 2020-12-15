//
//  main.swift
//  SwiftBasics
//
//  Created by Derrick Park on 12/10/20.
//
import Foundation
var s: String? = nil
// 1. force unwrap !
// 2. if-let
// 3. optional chaining
// 4. guard
// 5. ?? nil-coalescing operator (default value if nil)
print(s ?? "Bye")
// Unwrap twice to get the value
// var oo: Optaional<Optional<String>> // String??
// Higher-Order Functions (closure)
// - map
// - filter
// - reduce
// closures (functions) type syntax
// "functions are first-class citizen"
func fullName(firstName: String, lastName: String) -> String {
  return "\(firstName) \(lastName)"
}
var getFullName: (String, String) -> String = fullName
print(getFullName("Hello", "World"))
var countries: [String?] = ["Canada", "USA", "Japan", nil, "Brazil", nil]
//                         [   6,      3,      5,      0,     6,      0]
// "idiom"
for country in countries {
  if let country = country {
    print(country)
  }
}
//var nonNilCountries = countries.compactMap { $0 }
//for country in nonNilCountries {
//  print(country)
//}
// country: String?
// firstArg: $0, secondArg: $1, ...
var numOfChars: [Int] = countries.map { $0?.count ?? 0 }
print(numOfChars)