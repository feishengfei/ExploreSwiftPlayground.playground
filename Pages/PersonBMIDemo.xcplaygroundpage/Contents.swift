//: [Previous](@previous)

import Foundation

struct Person {
  var height: Double
  var weight: Double
  
  // compute attribute:
  var bmi: Double {
    weight / (height * height)
  }
  
  // compute attribute:
  var category: String {
    switch bmi {
      case ..<18.5: return "偏瘦"
      case ..<24.9: return "正常"
      case ..<29.9: return "偏重"
      default: return "肥胖"
    }
  }
}

var p = Person(height: 1.77, weight: 88)
print("Person bmi:\(p.bmi), \(p.category)")
