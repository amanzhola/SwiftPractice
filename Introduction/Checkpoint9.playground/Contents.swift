import Cocoa

func random(from array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

let a = [10, 20, 30 , 40]
let result = random(from: a)
print(result)

let b: [Int]? = []
let result1 = random(from: b)
print(result1)

let c: [Int]? = nil
let result2 = random(from: c)
print(result2)

// or better

let first = random(from: [1, 2, 3, 4, 5])
print("From [1, 2, 3, 4, 5]: \(first)")

let second = random(from: [])
print("From []: \(second)")

let third: [Int]? = nil
let thirdValue = random(from: third)
print("From nil: \(thirdValue)")
