import Cocoa

// checkpoint 4 square root from 1...10 000

enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func mySqrt(_ number: Int) throws -> Int {
    if number < 0 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    for i in 0...number {
        if i * i == number {
            return i
        }
        if i * i > number {
            break
        }
    }
    throw SquareRootError.noRoot
}

do {
    let result = try mySqrt(800)
    print(result)
} catch SquareRootError.outOfBounds {
    print("Number is out of bounds")
} catch SquareRootError.noRoot {
    print ("No square root")
}

// binary search 0(log n)
func integerSquareRootBinary (_ number: Int) throws -> Int {
    if number < 0 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    var left = 1
    var right = number
    while left <= right {
        let mid = (left + right) / 2
        let square = mid * mid
        if square == number {
            return mid
        } else if square < number {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    throw SquareRootError.noRoot
}

// Newton Method
func integerSqureRootNewton (_ number: Int) throws -> Int {
    if number < 0 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    var x = number
    
    while x * x > number {
        x = (x + number / x) / 2
    }
    
    if x * x == number {
        return x
    } else {
        throw SquareRootError.noRoot
    }
}

do {
    let result = try integerSqureRootNewton(49)
    print("Root is \(result)")
} catch SquareRootError.outOfBounds {
    print("Out of bounds")
} catch SquareRootError.noRoot {
    print("No integer root")
} catch {
    print("Unknown error")
}

// without multiply
func integerSqureRootNewtonWithoutMultiply (_ number: Int) throws -> Int {
    if number < 0 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    var sum = 0
    var odd = 1
    var root = 0
    
    while sum < number {
        sum += odd
        odd += 2
        root += 1
    }
    
    if sum == number {
        return root
    } else {
        throw SquareRootError.noRoot
    }
}

do {
    let result = try integerSqureRootNewtonWithoutMultiply(81)
    print("Root is \(result)")
} catch SquareRootError.outOfBounds {
    print("Out of bounds")
} catch SquareRootError.noRoot {
    print("No integer root")
} catch {
    print("Unknown error")
}
