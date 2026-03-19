import Cocoa

// checkpoint 8

protocol Building {
    var rooms: Int {get}
    var cost: Int {get set}
    var estateAgent: String {get set}
    
    func salesSummary()
}

struct House: Building {
    var rooms: Int = 3
    var cost: Int
    var estateAgent: String
    
    func salesSummary() {
        print("House with \(rooms) rooms, cost $\(cost), sold by \(estateAgent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var estateAgent: String
    
    func salesSummary() {
        print("Office with \(rooms) rooms, cost $\(cost), sold by \(estateAgent)")
    }
}
let house = House(rooms: 4, cost: 500_000, estateAgent: "Alice")
house.salesSummary()
let office = Office(rooms: 12, cost: 1_200_000, estateAgent: "Bob")
office.salesSummary()

// better option via extension

protocol Building1 {
    var rooms: Int {get}
    var cost: Int {get set}
    var estateAgent: String {get set}
    var buildingType: String {get}
    
    func salesSummary()
}

extension Building1 {
    func salesSummary() {
        print("\(buildingType) with \(rooms) rooms, cost $\(cost), sold by \(estateAgent)")
    }
}

struct House1: Building1 {
    let buildingType: String = "House"
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

struct Office1: Building1 {
    let buildingType: String = "Office"
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

struct Office12: Building1 {
    let buildingType: String = "Office"
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

let house1 = House1(rooms: 4, cost: 500_000, estateAgent: "Alice")
house.salesSummary()
let office1 = Office1(rooms: 12, cost: 1_200_000, estateAgent: "Bob")
office.salesSummary()

// option 3
protocol Building2 {
    var rooms: Int {get}
    var cost: Int {get set}
    var estateAgent: String {get set}
    
    func salesSummary()
}

struct House2: Building2 {
    var rooms: Int
    var cost: Int
    var estateAgent: String
    
    func salesSummary() {
        print("House with \(rooms) rooms, cost $\(cost), sold by \(estateAgent)")
    }
}

struct Office2: Building2 {
    var rooms: Int
    var cost: Int
    var estateAgent: String
    
    func salesSummary() {
        print("Office with \(rooms) rooms, cost $\(cost), sold by \(estateAgent)")
    }
}

let house3 = House2(rooms: 4, cost: 500_000, estateAgent: "Alice")
house3.salesSummary()
let office3 = Office2(rooms: 12, cost: 1_200_000, estateAgent: "Bob")
office3.salesSummary()

