import UIKit
import Foundation

var greeting: String = "Hello, playground"
let likeHummus = "like Hummus"

print(greeting)

greeting = "Felix " + greeting

print(greeting)

var name = "Jane"

greeting = name + " " + likeHummus

print(greeting)

let listOfPeople = ["Felix", "Jane", "Bob"]

// Iterating array of strings
print("-----------------------")
for name in listOfPeople {
    greeting = name + " " + likeHummus
    print(greeting)
}
