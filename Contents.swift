import Foundation

func printDash(
    comment: String = "",
    deli: String = "============================")
{
    print("\(deli) \(comment)")
}

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
printDash(comment:"Iterating array of strings")
for name in listOfPeople {
    // Here variable 'name' is just for temporary use
    //greeting = name + " " + likeHummus + "."
    
    // String interpolation
    greeting = "\(name) \(likeHummus) a lot."
    print(greeting)
}

printDash(comment:"After iteration")
greeting = "\(name) likes to skateboard."
print(greeting)

var names: [String] = [
    "Ron", "Elmo", "cookie", "big bird", "grover", "oscar"
]

printDash(comment:"Iterating array of strings")
for name in names {
    print("\(name) likes to skateboard.")
}

/*
 Multiline comment
 
 Introduction on structs
 */

struct PersonWithHobby {
    let name: String
    let hobby: String
}

let people : [PersonWithHobby] = [
    PersonWithHobby(
    name: "ron",
    hobby: "skateboard"
    ),
    PersonWithHobby(
    name: "Elmo",
    hobby: "KTV"
    ),
    PersonWithHobby(
    name: "cookie",
    hobby: "cooking"
    ),
    PersonWithHobby(
    name: "big bird",
    hobby: "flying"
    ),
    PersonWithHobby(
    name: "grover",
    hobby: "political"
    ),
    PersonWithHobby(
    name: "oscar",
    hobby: "Watching movie"
    ),
]

printDash(comment: "struct iteration")
for p in people {
    print("\(p.name) like \(p.hobby)")
}

