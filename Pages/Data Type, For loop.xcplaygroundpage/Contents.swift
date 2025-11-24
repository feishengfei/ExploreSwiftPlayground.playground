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

printDash(comment: "Int converter")

// Int converter


let big: Int64 = 999999999999
print("let big: Int64 = \(big)")
print("Int32.max: \(Int32.max)")

/*
 # 1️⃣ **init(_:)**

 最普通的转换，但行为**取决于来源与目标类型**。

 ## 👉 如果转换不会溢出 → 正常

 ## 👉 如果溢出 → 运行时报错（fatal error）

 **例：**
 */
// let x1 = Int32(big) // ❌ overflow → 运行时崩溃

/*
 # 2️⃣ **init?(exactly:)**（严格转换，安全，可失败）

 这是最安全、最守规矩的转换。

 如果值不能完全表示 → 返回 nil，不崩溃。
 */

printDash(comment: "init(exactly:)")
if let value = Int32(exactly: big) {
    print(value)
} else {
    print("转换失败")
}

/*
 # **init(clamping:)**（钳制转换，强行卡到范围内）

 如果值超出范围，会被“钳制”：

 - 超出上限 → 设为 `max`
 - 超出下限 → 设为 `min`
 
 特点：
 ### ✔ 永不崩溃
 ### ✔ 永不返回 nil
 ### ✔ 保证结果落在目标类型范围内
 ### ❗ 会丢失信息

 应用场景：
 - UI 数值限制
 - 某些范围逻辑（如 slider 范围）
 */

printDash(comment: "init(clamping:)")
let x2 = Int32(clamping: big)
print("x2 = \(x2)")   // → 2_147_483_647 (Int32.max)

/*
# 4️⃣ **init(truncatingIfNeeded:)**（按底层二进制直接截断）
这是底层二进制转换。
如果值超出范围，就取 **低 N 位**（溢出取模）。

例子：

```swift
let x = Int32(truncatingIfNeeded: big)
print(x)
```

结果是 big % 2^32 的值（可能是负数）。
### ✔ 永不崩溃
### ✔ 永不返回 nil
### ❗ 会发生二进制截断（可能完全不是你要的数）

适用：

- 底层 bit 操作
- 协议序列化/反序列化
- 你明确知道“我就是要二进制截断结果”
 */
printDash(comment: "init(truncatingIfNeeded:)")
let x3 = Int32(truncatingIfNeeded: big)
print("x3 = \(x3)")

/*
 5️⃣ init(bitPattern:)（位模式转换，不解释符号）
 用于：
 UInt → Int
 Int → UInt
 大小一样的类型
 例：
 let x = Int(bitPattern: UInt.max)
 print(x)
 等价于：
 不改变底层二进制
 只改变解释方式（有符号 / 无符号）
 应用：
 指针地址
 底层内存解析
 unsafeBitCast 类似用途
 */

printDash(comment: "init(bitPattern:)")
let x4 = Int32(bitPattern: UInt32.max)
print("x4 = \(x4)")

/*
 # 6️⃣ **init(truncating:)**（Swift 6 新增，严格意义上的截断）

 和 truncatingIfNeeded 类似，但用于 Decimal / BigInt → Int 等“可截断整数转换”。

 例：

 ```swift
 let d = Decimal(string: "999999999999")!
 let x = Int(truncating: d)
 ```

 直接截断小数或超大值的“整数部分”（可能溢出、可能截断）。

 用途较窄。
 */

printDash(comment: "init(truncating:)")
let d = Decimal(string: "999999999999")!
let x6 = Int(truncating: NSNumber("999999999999"))
print("x6 = \(x6)")
