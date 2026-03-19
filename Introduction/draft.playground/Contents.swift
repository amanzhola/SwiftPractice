import Cocoa

var greeting = "Hello, playground"
let name = "⭐ Amanzhol Aimov ⭐"
print(greeting, name)
print (name)
private var privateVariable = (greeting,name)
print (name)
name
greeting
greeting = "Hello World"
let dog = "Dog"
let actor = "Actor Amanzhol Aimov"
let longString = """
how are you 
great day
"""
var longString2: String = """
adflkjfladjfalskfjasf
"""
privateVariable
print(name.count)
let nameLength: Int = name.count
print(name.uppercased())
print(longString.hasPrefix("how"))
print(greeting.hasSuffix(".jpg"))
longString2 = """
    new long string
    """
let counter: Int = 10
var sum: Int = 0
for i in 1...counter {
    sum += i
}
print(sum)
let number = 0.1 + 0.2
print(number)
let celcium = 25
let fahrenheit: Double = (Double(celcium) * 9.0 / 5.0) + 32.0
print("Celcium of \(celcium) will be Fahrenheit =\(fahrenheit)")
var array = [1, 2, 3]
print(array[2])
array.append(5)

let employee = ["name": "Amanzhol","job": "programmer","location": "Atyrau"]
print(employee["name", default: "Unknown"])
print(employee["location", default: "Unknown"])
print(employee["job", default: "Unknown"])

let hasGraduated = [
    "Eric": false ,
    "Maeve": true ,
    "Otis": false
]

let olympic = [
    2012: "London",
    2016: "Rio",
    2020: "Tokyo"
]

print(olympic[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Amanzhol"] = 180
heights["Maeve"] = 160
heights["Otis"] = 170

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penquin"

// set
var actors = Set<String>()
actors.insert("Will Smith")
actors.insert("Tom Cruise")
actors.insert("Will Smith")
print(actors)

// enum
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

var day = Weekday.thursday
day = .sunday
print(day)

// for enum
enum HTTPStatus: Int {
    case ok = 200
    case notFound = 404
    case internalServerError = 500
}

let code = 404

if let status = HTTPStatus(rawValue: code) {
    print(status)
}

let array1 = [1, 2, 3, 3, 4, 4, 1, 2]
print(array1)
print(array1.count)
let array1_unique = Array(Set(array1))
print(array1_unique.count)

// tuples
let country = ("Kazakhstan", 16_000_000, 16)
print(country.0)
print(country.1)
print(country.2)
let country1 = (country: "Kazakhstan",population: 16_000_000, states: 16)
print(country1.country)

// condition
let score = 88

if score >= 90 {
    print("A")
} else if score >= 80 {
    print("B")
} else if score >= 70 {
    print("C")
} else {
    print("D")
}

let ourname = "Dave Lister"
let freindname = "Arnold Rimmer"

if ourname < freindname {
    print("it's \(ourname) vs \(freindname)")
}

if ourname > freindname {
    print("it's \(freindname) vs \(ourname)")
}

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let country2 = "Canada"

if country2 == "Australia" {
    print("G'day")
}

let name2 = "Taylor Swift"

if name2 != "Anonimous" {
    print("Welcome, \(name2)")
}

var username = ""

if username.isEmpty == true {
    username = "Anonimous"
}
print("Welcome, \(username)")

enum TrasnportOption {
    case airplane, helicopter, train, bicycle, car, escooter
}

let transport = TrasnportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bick path..")
} else if transport == .car {
    print("Time to get stuck in traffic")
} else {
    print("I'm going to hire a scoter now!")
}
// switch
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
    case .sun: print("It's a nice day")
    case .rain: print("Pack an umbrealla.")
    case .wind: print("Wear something warm")
    case .snow: print("School is canceled")
    case .unknown: print("Out forecast generator is broken!")
}
let place = "Gotham"

switch place {
case "Gotham": print("Your're Batman!")
    fallthrough
case "mega-City One": print("You're Judge Dredd!")
case "Wakanda": print("You're Back Panther!")
default: print("Who you are?")
}
// for loop
let numbers2: [Int] = [1, 2, 3, 4, 5]
/*
for os in numbers2 {
    print("Swift works with \(os)")
}
for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("  \(j) x \(i) = \(i * j)")
    }
    print()
}
*/
var lyric = "Haters gonna"

for _ in 0...5 {
    lyric += " hate"
    
}
print(lyric)
for _ in 0...3 {print("Hip hip hurry")}
var countdown = 5
while countdown > 0 {
    print(countdown)
    countdown -= 1
}
print("Blast off")

var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critical hit!")
/*
 while 0 < 5 {
 print("I'm conting to 5!")
 }
 */
var counter1 = 2
while counter1 < 64 {
    print("\(counter1) is a power of 2.")
    counter1 *= 2
}
let filename = ["me.jpg", "cat.png", "bird.jpg"]
for filename in filename {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picure: \(filename)")
}

let number1 = 4
let number2 = 14
var multiple = [Int]()
for i in 1...100_000{
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiple.append(i)
        
        if multiple.count == 10{
            break
        }
    }
}
print(multiple)

var xnumber = 1

repeat {
    print(xnumber)
    xnumber += 1
} while xnumber < 5

print("Ready or not here I come!")
            
hello: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("it's a bullseye")
            break hello
        }
            
        }
    }

var hoursStudied = 0
var goal = 10
repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 1
        continue
    }
    print("I've stadied for \(hoursStudied) hours")
} while hoursStudied < goal
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
            }*/
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
// func
func printTimesTables(number: Int, end:Int) {
    for i in 1 ... end {
        print("\(number) * \(i) is \(number * i)")
    }
}
printTimesTables(number: 5, end: 10)
// return func
func rollDice() -> Int {
    Int.random(in: 1...6)
}

let resut = rollDice()
print(resut)

func compare(name: String, name2: String) -> Bool {
    return name.sorted(by: <) == name2.sorted(by: <)
}

compare(name: "abcd", name2: "dcba")

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
areLettersIdentical(string1: "abcd", string2: "dcba")

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(pow(a, 2) + pow(b, 2))
}

let c = pythagoras(a: 3, b: 4)
print(c)

// tuples
func getUser3()->(firstName: String,lastName: String){
    (firstName: "John",lastName: "Doe")
}
let (firstName, _) = getUser3()

print("Name \(firstName)")
print("Name:\(getUser3().0) \(getUser3().1)")

// external and internal parameter names

func isUpperCase(_ string: String) -> Bool {
    string == string.uppercased()
}

let sting = "HELLO, WORLD!"
let result = isUpperCase(sting)

func printTimesTable(for number: Int){
    for i in 1...10 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTable(for: 5)

// default values for func
func printTimesTable( _ number: Int = 5, end: Int = 10) {
    print()
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
    print()
}

printTimesTable(5)
printTimesTable()
printTimesTable(10, end: 5)

var character = ["Lana", "Pam", "Ray", "Sterling"]
print(character.count)
character.removeAll(keepingCapacity: true)
print(character.count)

// error handle

enum PasswordError: Error {
    case Short
    case obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.Short}
    if password == "12345" {throw PasswordError.obvious}
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excelent"
    }
}
/*
do {
    try someRiskyWork()
} catch {
    print("Handle errors here")
}
*/

let string = "12345"
/*
do {
    let result = try checkPassword(string)
    print ("Password rating: \(result)")
} catch PasswordError.Short {
    print("Please use a longer password")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error \(error.localizedDescription)")
}
*/
do {
    let result = try checkPassword(string)
    print ("Password rating: \(result)")
}  catch {
    print("There was an error \(error.localizedDescription)")
}
// variadic

print ("Haters", "gonna", "hate")

func square (numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

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
    let resut = try mySqrt(800)
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
// without multiply

func integerSqureRootNewtonWithoutMultiply (_ number: Int) throws -> Int {
    if number < 0 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    var sum = 0
    var odd = 1
    var root = 0
    
    if sum == number {
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

// create and use closures

func greetUser() {
    print("Hi there")
}

greetUser()

var greetCopy = greetUser
greetCopy()
/*
let sayHello = {print("Hi hello")}
sayHello()
*/
let sayHello = { (name: String) -> String in
    "Hello \(name)!"
}

sayHello("Alice")
print(sayHello("Alice"))

let team = ["Gloria", "Alice", "Bob", "David", "Eve"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captianFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Alice" {
        return true
    } else if name2 == "Alice"{
        return false
    }
    
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captianFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Bob" {
        return true
    } else if name2 == "Bob" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeam)
let reverseTeam = team.sorted{$0 > $1}
let reverseTeam2 = team.sorted {$1 > $0}
let uppercaseTeam = team.map {$0.uppercased()}
print(uppercaseTeam)

func makeArray(size: Int, using generator: () -> Int) -> [Int]{
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let newRools = makeArray(size: 50, using: generateNumber)
print(newRools)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void){
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork{
    print("This is the First work")
} second: {print("This is Second work")
} third: {print("This is Third work")
}

func makeSale(signContract: (String) -> Void){
    let clientName = "Apple"
    print("\(clientName) should buy our product.")
    print("You're interested? Great! Sing here.")
    signContract(clientName)
}

makeSale{ (client: String) in
    print("We agree to pay you $100 million.")
    print("Signed, \(client)")
}

func processPrime(using closure: (Int) -> Void){
    let primes = [2,3,5,7,11,13,17,19]
    for prime in primes {
        closure(prime)
    }
}
processPrime{ (prime: Int) in
    print("\(prime) is a prime number.")
    let square = prime * prime
    print("\(prime) squared is \(square)")
}
// checkpoint 5

let luckyNumbers = [17, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers
    .filter { !$0.isMultiple(of: 2)}
    .sorted()
    .map { "\($0) is a lucky number"}
    .forEach { print($0)}

// struct
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}
let red = Album(title: "Red", artist: "Tayler Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BIS", year: 2016)
print(red.title)
print(wings.artist)
red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaning: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaning > days {
            vacationRemaning -= days
            print("I'm going on vacation!")
            print("Days remaning: \(vacationRemaning)")
        } else {
            print("Oops! There aren't enought days remaining")
        }
    }
}
    
var archer = Employee.init(name: "Sterling Archer", vacationRemaning: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaning)

// custom initializers
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player1 = Player(name: "Megan R")
print(player1.number)

// static properties and methods
@MainActor
struct School {
    static var studentCount = 0
    
    static func addStudent(student: String) {
        print("\(student) joined the school!")
        studentCount += 1
    }
}
School.addStudent(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version: String = "1.0"
    static let saveFileName: String = "saved_data.json"
    static let homeURL: URL = URL(string: "https://www.example.com")!
}

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool){
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible = false
    //let isConvertible: Bool
    /*
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectic: isElectric)
    }*/
}
//let teslaX = Car(isElectric: true, isConvertible: false)
let teslaX = Car(isElectric: true)
// copy class
class User {
    var username = "Anonymous"
    
    func copy () -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"
print(user1.username)
print(user2.username)

class User1 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User1 \(id): I'm alive")
    }
    
    deinit {
        print("User1 \(id): I'm dead")
    }
}
var users = [User1]()

for i in 1...3 {
    let user = User1(id: i)
    print("Uer1 \(user.id): I'am in control")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// how to work with variables insdie classes
class User2 {
    var name = "Paul"
}

let user3 = User2()
user3.name = "Taylor"
print(user3.name)

class User4 {
    var name = "Paul"
}

var user = User4()
user.name = "Taylor"
user = User4()
print(user.name)

// checkpoint 7
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

// protocols

protocol Vehicle1 {
    var name: String {get}
    var currentPassengers: Int {get set}
    func estimatedTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car1: Vehicle1 {
    let name = "Car"
    var currentPassengers: Int = 1
    
    func estimatedTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int){
        print("I'm driving \(distance) km")
    }
    
    func openSunroof(){
        print("It's a nice day")
    }
}

struct Bicycle: Vehicle1 {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimatedTime(for distnace: Int) -> Int {
        distnace / 10
    }
    
    func travel(distance: Int) {
        print("I'm ycycling \(distance) km")
    }
}

func commute(distance: Int, using vehicle: Vehicle1){
    if vehicle.estimatedTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle1], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimatedTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) km")
    }
}

let car = Car1()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

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

// optionals
var username1: String? = nil

if let unwrappedUsername1 = username1 {
    print("We got a user: \(unwrappedUsername1)!")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number3: Int? = nil

if let number = number3 {
    print(square(number: number))
}
// guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("No number provided.")
        return
    }
    print(square(number: number))
}

printSquare(of: 5)
printSquare(of: nil)

// how to unwrap optionals with nil coaliscing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book( title: "Beowulf", author: nil)
let author22 = book.author ?? "Anonymous"
print(author22)

let input = ""
let number11 = Int(input) ?? 0
print(number11)

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No name selected"
print("Next in line: \(chosen)")

struct Book3 {
    let title: String
    let author: String?
}

var book22: Book3? = nil
let author = book22?.author?.first?.uppercased() ?? "Anonymous"
print(author)

// Failable initializers

let str = "5"
let num = Int(str)

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9{
            self.id = id
        } else {
            return nil
        }
    }
}

let person = Person(id: "123456789")
if let person = person {
    print(person)
} else {
    print("nill")
}

