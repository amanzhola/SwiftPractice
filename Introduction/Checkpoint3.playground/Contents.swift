import Cocoa

/*
var i = 0

while i < 100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
                
    i += 1
}
*/

for data in 1 ... 100 {
    if data.isMultiple(of: 15) {
        print("FizzBuzz")
    } else if data.isMultiple(of: 3) {
        print("Fizz")
    } else if data.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(data)
    }
}

for i in 1 ... 100 {
    switch (i.isMultiple(of: 3), i.isMultiple(of: 5)) {
        case (true, true):
        print("FizzBuzz")
    case (true, false):
        print("Fizz")
    case (false, true):
        print("Buzz")
    default:
        print(i)
    }
}

