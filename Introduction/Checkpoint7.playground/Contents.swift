import Cocoa

// checkpoint 7

var greeting = "Hello, playground"
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof!")
    }
}

class Cordi: Dog {
    override func speak() {
        print("Corgi says: Yap yap!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle says: Woof woof!!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meow")
    }
}

class Persian: Cat {
    
    override func speak() {
        print("Persian cat says: Meoooow")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion roars: ROAR!")
    }
}
