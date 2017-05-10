//: Playground - noun: a place where people can play

import UIKit

// Swift infers types
// Swift is strongly typed - a constant or variable cannot be 're-typed'
// Swift is compiled vs Ruby or JavaScript which are interpreted

print("The maximum value of INT \(Int.max)")
print("The minimum value of INT \(Int.min)")
print("The maximum value of INT32 \(Int32.max)")
print("The minumum value of INT32 \(Int32.min)")


// C-style for loops are deprecated in Swift 3, for-in loops are Swifty

for i in 1...5 {
    print(i)
}

for i in 1..<5 {
    print(i)
}

// equivalent to for i in 1...5
var i = 1
while i < 6 {
    print(i)
    i = i+1
}

var toDoList: [String] = ["Learn iOS", "Build the next Flappy Bird", "Retire wealthy"]

var toDoListAdd: [String] = [String]()
toDoListAdd.append("Learn iOS")
toDoListAdd.append("Build the next Flappy Bird")
toDoListAdd.append("Retire")
print(toDoListAdd)

var toDoListInfer = [String]()

// Arrays can use 'range' that for-in loops use

var arrayOfInts = [1,2,3,4,5]
print("\(arrayOfInts[0...1])")
print("\(arrayOfInts[1..<4])")
print("\(arrayOfInts[2...3])")

arrayOfInts.append(6)
print(arrayOfInts)
arrayOfInts.remove(at: 0) // returns 'removed' item
print(arrayOfInts)
arrayOfInts.insert(7, at: 5)
print(arrayOfInts)

// --- Swift Array Notes ---

// Initiliazing an empty array with a type
var emptyDoubles: [Double] = []


// Swift infers an immutable Array of 'Int'
let oddNums = [1,3,5]

// Array repeating initializer: intializes array with default value and size
var digitCounts = Array(repeating: 1, count: 10)
print(digitCounts)

// some array properties
var testArr = [1,2,3,4,5]
print(testArr)

// optional type of String or nil value
var optionalVar: String?

// if let, Optional Binding
var present: String? = "Apple Watch"
if let unwrappedPresent = present {
    print("Woo! \(unwrappedPresent)")
}

// Force unwrap with !
print("Force woo! \(present!)")

// Implicitly unwrapped optional
var presentImp: String! = "Apple Watch"


// ---- Swift Array Properties ----

// number of elements the array can contain without allocating new storage
testArr.capacity

// number of elements in the collection
testArr.count

// a textual representation of the array and its elements
testArr.description

// position one greater than the last valid subscript
testArr.endIndex

// first element of the collection
testArr.first

// returns true or false
testArr.isEmpty

// last element in array
testArr.last

// what is eager/lazy??
testArr.lazy

// position of the first element, always 0 in non-empty
testArr.startIndex

// ---- Swift Array Methods ----

testArr.append(7)
testArr.insert(6, at:5)
testArr.contains(3)

testArr.distance(from: 1, to: 4)

// ---- Swift Dictionary notes ----

var emptyDictInit = [String: Int]()

var testDict = [
    "Kobe": 24,
    "Lebron": 23,
    "Rondo": 9
]

// when accessing a Dictionary we receive an Optional Type in return
var jerseyNum = testDict["Kobe"]

// Direct unwrapping with !
var jerseyNumUnwrap = testDict["Kobe"]!

// Optional Binding
if let jerseyNum = testDict["Kobe"] {
    print(jerseyNum)
}

// key doesn't exist so it is added to the dictionary
testDict["Fisher"] = 2

// key exists so value is updated
testDict["Kobe"] = 77

// a value of nil will remove a key-value pair
testDict["Kobe"] = nil
print(testDict)

// method (message?) of 'removeValue' will return an Optional Type of the value from the key-value pair acted on
var removeMe = testDict.removeValue(forKey: "Rondo")
print(removeMe)


for (key, value) in (testDict){
    print("The key is \(key) and the value is \(value)")
}

for imATuple in testDict {
    print(imATuple)
}

// ---- Swift function notes ----

// argument is given a type
func sayHello(name: String) {
    print("Hello, \(name), how are you doing today?")
}

sayHello(name: "Jam")

// External parameter example
func printDescription(width w: Int, height h: Int) {
    print("My width is \(w) and my height is \(h)")
}

printDescription(width: 10, height: 20)

// More Swift-like
func printDescriptionWithWidth(w: Int, andHeight h: Int) {
    print("My width is \(w) and my height is \(h)")
}
printDescriptionWithWidth(w: 10, andHeight: 20)

// The argument of a function is assigned as a constant
func argAsConst(someInt: Int) {
    // the below would throw an error because someInt is a constant
    // someInt = someInt + 1
    
    var noLongerConst = someInt
    noLongerConst = noLongerConst + 1
    print(noLongerConst)
}

// ---- Swift classes, structs ----


// class Person with properties of species (read-only) and name (assigned on init)
class Person {
    let species = "H. Sapiens"
    var name: String
    
    // Person initialzer function
    init(name: String) {
        self.name = name
    }
    func speak(){
        print("Hello! I am a \(self.species) and my name is \(self.name)")
    }
}

// myPerson is a type Person. Init is called with name: 'Jam'
var myPerson: Person = Person(name: "Jam")
myPerson.speak()

// Structs are generally used for creating a collection of values
// Methods provide gettors and settors of these values

struct Rectangle {
    var width = 10
    var height = 20
    
    // Does not change value of properties
    func printDesc() {
        print("I have a width of \(width) and a height of \(height)")
    }
    // marked with 'mutating'
    mutating func doubleWidth() {
        width *= 2
    }
}

// Structs are value-types vs classes as reference-types
// Structs also have an implicit constructor so one does not need to be defined

// Advanced struct usage example
//struct Drawing {
//    var actions: [DrawingAction]
//}
//
//struct DrawingAction {
//    var samples: [TouchSample]
//    var tool: Tool
//    
//    enum Tool {
//        case Pencil(color: UIColor)
//        case Eraser(width: CGFloat)
//    }
//}

// Every type in Swift that is not an instance of a class or function is a Value Type. This includes Strings,

class Persons {
    var species = "H.Sapiens"
    var name: String
    init(name: String) {
        self.name = name
    }
    func speak() {
        print("Hello! I am a \(self.species) and my name is \(self.name)")
    }
}

// subclassing, creating a new class based on another class
class Developer: Person {
    var favoriteLanguage: String
    init(name: String, favoriteLanguage: String){
        self.favoriteLanguage = favoriteLanguage
        // super class init called after initialization of child properties
        super.init(name: name)
    }
    
    // overriding the 'speak' method from the super class
    override func speak() {
        print("Hello! I am a Developer. My name is \(self.name)")
    }
}

var myDeveloper: Developer = Developer(name: "Jay", favoriteLanguage: "Swift")
myDeveloper.speak()

//class Animal {
//    var name: String
//    var health = 100
//    init(name: String) {
//        self.name = name
//    }
//    
//    func displayHealth() {
//        print("Health: \(self.health)")
//    }
//}
//
//class Cat: Animal {
//    init(name: String){
//        self.health = 150
//        super.init(name: name)
//        
//    }
//}






// ---- C/Objective-C/Swift notes ----
// Obj-C is a strict superset of C, so everything valid in C is also valid in Obj-C
// Obj-C adds syntax and semantics for OOP
// New function calls can be created at run-time in Obj-C
// Obj-C basically adds objects to C, but keeps things simpler than C++

// Swift classes are passed by reference, structs are passed by values
// Swift structs can have methods, properties, initializers, and protocols







