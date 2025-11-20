import Foundation

var greeting: String = "Hello, playground"
let likeHummus = "like Hummus"

print(greeting)

greeting = "Felix " + greeting

print(greeting)

var name = "Ron"

greeting = name + " " + likeHummus

print(greeting)

let listOfPeople = ["Felix", "Jane", "Bob"]

// Iterating array of strings
print("-----------------------")
for name in listOfPeople {
    // Here variable 'name' is just for temporary use
    //greeting = name + " " + likeHummus + "."
    
    // String interpolation
    greeting = "\(name) \(likeHummus) a lot."
    print(greeting)
}

print("-----------------------")
greeting = "\(name) likes to skateboard."
print(greeting)

var names: [String] = [
    "Ron", "Elmo", "cookie", "big bird", "grover", "oscar"
]

print("-----------------------")
for name in names {
    print("\(name) likes to skateboard.")
}

