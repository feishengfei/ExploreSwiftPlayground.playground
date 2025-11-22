//: [Previous](@previous)

import Foundation

func dumpValue<T>(_ v: T) {
    print("value = \(v), type = \(type(of: v))")
}

func printDash(
    comment: String = "",
    deli: String = "============================")
{
    print("\(deli) \(comment)")
}

func divide(_ dividend: Int, _ divisor: Int) throws -> (quotient: Int, remainder: Int) {
    if divisor == 0 {
        throw NSError(domain: "DivideByZero", code: 1, userInfo: nil)
    }
    return (dividend / divisor, dividend % divisor)
}

print("Let's talk about data type")
print("Int, Double, Float, \"Type of\"")

var a: Int = 100

var b = 100.0
var c: Float = 100.0
var s: String = "100.0"


dumpValue(a)
dumpValue(b)
dumpValue(c)
dumpValue(s)
dumpValue(Int.max)
dumpValue(Int.min)
dumpValue(Int64.max)
dumpValue(Int64.min)
dumpValue(Int32.max)
dumpValue(Int32.min)
dumpValue(Float.greatestFiniteMagnitude)
dumpValue(Double.greatestFiniteMagnitude)

// Division
print("Division")
let dividend = 112

for divisor in 0..<10 {
    do {
        let result = try divide(dividend, divisor)
        print("\(dividend) / \(divisor) = \(result)")
    } catch {
        print("\(dividend) / \(divisor) error: \(error)")
    }
}



