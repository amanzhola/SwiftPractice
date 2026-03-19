import Cocoa

struct Car {
    let model: String
    let seats: Int
    private(set) var currentGear: Int
    
    init(model: String, seats: Int, currentGear: Int = 1) {
        self.model = model
        self.seats = seats
        self.currentGear = min(max(currentGear, 1), 10)
    }
    
    mutating func changeGear(up: Bool) {
        if up {
            if currentGear < 10 {
                currentGear += 1
            } else {
                print("Alredy max gear")
            }
        } else {
            if currentGear > 1 {
                currentGear -= 1
            } else {
                print("Alredy min gear")
            }
        }
    }
}

var car = Car(model: "Toyota Corolla", seats: 4)
print("Current gear: \(car.currentGear)")
car.changeGear(up: true)
print("Current gear: \(car.currentGear)")
car.changeGear(up: false)
print("Current gear: \(car.currentGear)")

// model - let as no change
// seats - let as no change
// currentGear - var as require change
// private(set) - avoid car.currentGear = 999
// mutating - since change of struct property
// 1 to 10 - check range from and to 
