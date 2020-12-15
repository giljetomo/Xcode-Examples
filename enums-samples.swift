//
//  main.swift
//  SwiftBasics
//
//  Created by Derrick Park on 12/10/20.
//
import Foundation
enum PlaySpeed: Int {
  case slow = 1, normal, fast, custom
}
print(PlaySpeed.fast.rawValue)
// Raw values are immutable (constant) and cannot be changed.
// NONO - PlaySpeed.fast.rawValue = 10
enum AudioRate: String {
  case slow, normal = "Normal", fast, custom
}
print(AudioRate.normal.rawValue)  // "normal"
enum Power: Int {
  case poor = 10, medium = 20, strong = 30
}
print(Power.poor.rawValue)
enum LetterToInt: Int {
  case a = 1, b, c, d, e, f
}
var adrianoPower: Power? = Power(rawValue: 30)
if let adrianoPower = adrianoPower {
  print(adrianoPower)
}
if let myAudioRate = AudioRate(rawValue: "custom") {
  print(myAudioRate)
}
// --------------- Raw Values DONE ------------------- //
// "Associated Values"
enum LibraryFee {
  case overdueBook(days: Int)
  case lostBook(price: Double)
  case lostLibraryCard(timesLost: Int)
  case annualFee
}
let fee = LibraryFee.overdueBook(days: 100)
enum Color {
  case white, black, orange, red, purple, pink, green, blue
}
enum ImageFilter {
  case sepia
  case verticalGradient(from: Color, to: Color)
  case horizontalGradient(from: Color, to: Color)
  case sketch(penThickness: Double?)
}
let filters: [ImageFilter] = [ImageFilter.verticalGradient(from: .white, to: .black), ImageFilter.horizontalGradient(from: .white, to: .black), .sepia, .sketch(penThickness: 30)]
for filter in filters {
  switch filter {
    case .sepia:
      print("Apply Sepia filter!")
    case let .verticalGradient(color1, color2) where color1 == .white:
      print("Vertical gradient with white and \(color2)")
    case .horizontalGradient(var color1, _):
      color1 = .black
      print("Horizontal gradient with \(color1) and white")
    case .sketch(let thickness):
      if let thickness = thickness {
        print("sketch using \(thickness) pen")
      } else {
        print("sketch using default pen")
      }
    default:
      print("Good!")
  }
}
// HTTP Response
// success
// failure
enum HTTPResponse {
  case success(json: String)
  case failure(error: Error)
}
var res: HTTPResponse = .success(json: "{ \"hello\": \"world\" }")
switch res {
  case .success(let json):
    print("Decode the \(json) json string.")
  case .failure(let error):
    print("Error: \(error.localizedDescription)")
}