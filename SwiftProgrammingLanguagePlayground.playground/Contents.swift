import UIKit

// No semicolon in Swift, it's not required

let name = "Northeastern University"
// let is used for constant variable

var greeting = "Hello"
// var is used for variable that will change

// Swift will figure out the variable type by itself
var age = 21

// Or we could tell Swift explicitly the vairable type, but we don't have to do this
let MyName: String = "Guanguan"
var myAge: Int8 = 25
print(Int8.max)
print(Int16.max)

//Different data types, there are more data types
/*
 Int eg. 16
 Float eg. 5.6
 Double eg. 3.124545
 Boolean eg. True/ False
 Character eg. 'a' 'B' '='
 String eg. "Guanguan"
 Array eg. [1,2,3,4]
 Set
 */

// Initiate an array of integers
var arrOne = [1,2,3]
// Initiate an array of integers, not necessary to declare Int type
var arrTwo:[Int] = [1,2,3]

// But if you want to initiate an empty array, you need to specify the type og the array, otherwise you'll have error message
var emptyArr: [Int] = []


// Operators
/*
 1. Arithmetic operators 算术运算
 Add +
 Subs -
 mult *
 divide /
 remainder %
 
 2. Assignment operators
 =
 
 3. Comparision operators
 Equal ==
 Not equal !=
 Greater than >
 Less than <
 Greater than equal to >=
 Less than equal to <=
 And &&
 Or ||
 
 4. Ternary conditional operators 三元条件运算符
 Condition ? valueOne : valueTwo
 
 While assigning a variable, if the condition is true, the vairable will be valueOne, otherwise, the variable will be valueTwo
 
 Example:
 let howOldAreYou = age > 40 ? "Experienced" : "Young"
 
 print(howOldAreYou)
 */


//String interpolation 添写;插补
let firstName = "GG"
let lastName = "Wu"

let helloString = "Hello \(firstName) \(lastName) , wlecome to the class."
print(helloString)


// Collection Types
var friends: [String] = []
friends.append("Tom")
friends.append("Bill")
friends.append("Mark")
friends.append("Peter")
print(friends)
print(friends.count)
print(friends.first)
print(friends.endIndex)
print(friends.remove(at: 0))

friends[0] = "Andy"
let firstFriend = friends[0]
print(firstFriend)

for friend in friends {
    print(friend)
}

// enumerate 列举，枚举
for (index, friend) in friends.enumerated(){
    print("Friend Name = \(friend) ; Index = \(index)")
}


// Sets
/* Array can have multiple same item inside, but set can only have unique value*/
/* Create an empty set */
var breakfastItems = Set<String>()
breakfastItems.insert("Pizza")
breakfastItems.insert("Burger")
print(breakfastItems.contains("Burger"))

for food in breakfastItems.sorted() {
    print(food)
}

/* If you initialize like this 'var breakfastItemsInitialized = ["Apple", "Egg", "Salad"]', it will generate an array; So if you want to generate a set, you need to specify its a set explicitly. This one is not inferred means I'm telling you explicitly this is a set of string.*/
var breakfastItemsInitialized: Set<String> = ["Apple", "Egg", "Salad"]

/* Another way, only tell it's a set */
var breakfastItemsInferred: Set = ["Apple", "Egg", "Salad"]


// Dictionary : HashTable
/* Dictionary is similar to HashTable */
/* An array of value pairs. The first String is a key, and the second String is the value */
/* Initialize an empty one */
var countryDetailsEmpty: [String: String] = [:]

var countryDetailsInitialized: [String: String] =
[
    "US": "United States",
    "IN": "India",
    "CN": "China",
    "CA": "Canada",
]

var countryDetailsInferred =
[
    "US": "United States",
    "IN": "India",
    "CN": "China",
    "CA": "Canada",
]

print("\(countryDetailsInferred["IN"])")

countryDetailsInferred.removeValue(forKey: "EN")
countryDetailsInferred["CA"] = nil

countryDetailsInferred.updateValue("Country India", forKey: "IN")
print(countryDetailsInferred)

for (countryCode, countryName) in countryDetailsInferred{
    print("Country Code = \(countryCode) ; Country Name = \(countryName)")
}


// While Loop
var i = 0
let endIndex = 5
while i < endIndex {
    print("I'm here")
    i = i + 1
}

if age < 40 {
    print("You're young")
} else {
    print("You are experienced")
}


// Switch
let letter = "a"

switch letter {
case "a", "A":
    print("This is first letter")
case "z":
    print("This is last letter")
default:
    print("This is some fo the middle letter")
}


// Optional ?
/* This String type is optional */
var myName: String?
print(myName)

var myInt: Int?
myInt = 5
let multipliedBy5 = myInt! * 5
// exceptional !, need attention when use it


// if let
if let value = myInt{
    let multipliedBy5 = value * 5
    print(multipliedBy5)
}


// Function
/* It's not getting any variables, nor returning any variables*/
func greet() {
    print("Hello")
}
/* Call the function */
greet()

func greetWithName(firstName : String, lastName : String){
    print("Hello \(firstName), \(lastName)")
}

greetWithName(firstName: "Tinglin", lastName: "Man")

/* Define a function that will return a String*/
func getFullName(_ firstName: String, _ lastName: String) -> String {
    return "\(firstName), \(lastName)"
}

print(getFullName("Tinglin","Man"))

var a = 5
var b = 6
/* inout means I'm telling it do not create a new variable, this is the same variable as the top a*/
func incrementByOne(_ a: inout Int){
    a = a + 1
    
}
incrementByOne(&a)
print("Value of a inside function = \(a)")


// Structures
/* The first letter is upper case */
struct User {
    let firstName: String
    let lastName: String
    var age: Int
    
    func getFullName() -> String{
        return "\(firstName), \(lastName)"
    }
}

var guanguan = User(firstName: "Guanguan", lastName: "Wu", age: 21)
print(guanguan.getFullName())


// Enums
enum ColorEnum {
    case red
    case green
    case blue
}

print(ColorEnum.red)

enum IntEnum : Int{
    case one = 1
    case two
    case three
}

print(IntEnum.two.rawValue)

enum CityEnum : String {
    case DEL = "Delhi"
    case SEA = "Seattle"
    case PDX = "Portland"
}
print(CityEnum.PDX )
print(CityEnum.PDX.rawValue)


// Class
class UserClass {
    let firstName: String
    let lastName: String
    var age: Int
    
    func getFullName() -> String{
        return "\(firstName), \(lastName)"
    }
    
    init(firstName : String, lastName : String, age: Int){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

var billGates = UserClass(firstName : "Bill", lastName: "Gates", age : 55)

print(billGates.getFullName())
