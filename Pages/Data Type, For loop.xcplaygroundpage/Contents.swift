//: [Previous](@previous)

import Foundation

print("Let's talk about data type")
print("Int, Double, Float, \"Type of\"")

var a: Int = 100

var b = 100.0
var c: Float = 100.0
var d: String = "100.0"

func dumpValue<T>(_ v: T) {
    print("value = \(v), type = \(type(of: v))")
}

dumpValue(a)
dumpValue(b)
dumpValue(c)
dumpValue(d)
dumpValue(Int.max)
dumpValue(Int.min)
dumpValue(Int64.max)
dumpValue(Int64.min)
dumpValue(Int32.max)
dumpValue(Int32.min)
dumpValue(Float.greatestFiniteMagnitude)
dumpValue(Double.greatestFiniteMagnitude)
