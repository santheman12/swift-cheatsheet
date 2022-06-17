import UIKit


//Variables-------


var myName = "San" //CAN change "var" variables
myName = "Sankalp"

let count = 3 // CAN NOT change "let" variables

//STRINGS--------------

// \" (backspace quote) adds a quotation mark inside a string
let quote = "He said \"How could he?!\" to his friend."


//strings on multiple lines, also prints it out on multiple lines
let movie = """
A day in the
life of an Engineer
"""
// a backslash+n does the same thing
let movie2 = "A day in the\nlife on an Engineer"
print(movie2)

print(name.count) //print the number of letters in name

print(quote.hasPrefix("He")) //true, quote started with "He"
print(quote.hasSuffix("Friend.")) //false, swift is case sensitive. ends with "friends." not "Friends."'


//String Interpolation----------

//putting something in \(...) allows you to put it in strings
//whether its a variable or not
let name = "San"
let age = 20
let message = "My name is \(name) and I'm \(20) years old"
print(message)


//Variable Types---------

//can't alter let (constant) variables, but you can use them
let score = 10
let higherScore = score + 10
let halvedScore = score/2

//but with var variables, you can change them
var counter = 5
counter += 5

//integers come with their own functions
let number = 120
print(number.isMultiple(of: 10)) //true

//The Integer Class has functions too
let randNum = Int.random(in: 1...100)
print(randNum)


let score2 = 3.1 //double
let score3 = 5.0 //also double

let isGameOver = false //bool value
let isRaining = true //bool vlaue

//Arrays-----------

//all value have to be the SAME type
var colors = ["red", "orange", "blue"]
let numbers = [4, 5, 1, 5, 5+4]
var readings = [5.6, 3.5, 3.1, 94.5]

print(numbers)
print(readings[2]) //3.1

colors.append("yellow") //when appending, it has to be the same type as the others in the array
colors.remove(at: 2) //removes "blue"
var arrayCount = colors.count


//dictionaries---------
let employee = [
    "name": "Sam",
    "job": "singer"
]
print(employee["job", default:"Unknown"]) //prints singer
print(employee["age", default:"Unknown"]) //if value not defined, prints the default, in this case, "unknown"

//sets--------------

//sets dont have a particular order and dont store duplicates

var nums = Set([1, 2, 3, 4, 4, 5])
print(nums) //in random order, and no duplicates

nums.insert(10) //not append bc there is no particular order

//sets have an advantage over arrays because funtions on sets run instantly

//enums--------------

enum Weekday{
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .thursday

//type annotations------------

var num2: Double = 0

let player: String = "san"

let luckyNum: Double = 44.4
let pi: Double = 3.14
var isNight: Bool = false


var arr: Array<String> = ["bruh", "dude"]
var arr2: [String] = ["bruh", "dude"] //same things

var dict: [String: String] = ["id": "sankalpvarshney"]
var books: Set<String> = Set(["Magic Tree House", "39 Clues"])

var teams: [String] = [String]() //empty array
var clues = [String]() //same thing

enum UIStyle{
    case light, dark , system
}
var styles: UIStyle = .light

//Conditonal Statements --------

let ageNum = 16
if ageNum < 12{
    print("you cant vote yet")
}else if age < 18{
    print("soon you can vote")
}else{
    print("you can vote now")
}
//&& is and
// || is or

//Switch-------------

enum Weather{
    case sunny, rainy, windy
}

var forcast = Weather.sunny

switch forcast{
case .sunny:
    print("nice outisde")
case .rainy:
    print("take an umbrella")
default:
    print("you should be ok")
}
//need a case for all the possible values in enum OR you need a default case at the bottom

//funtions---------

func printTimesTable(num: Int){
    //1...12 is all inclusive (includes 1 and 12)
    //if you want to exclude 12, then 1..<12, this will go till 11
    for i in 1..<12{
        print("\(i) times \(num) equals \(i*num)")
    }
}

printTimesTable(num: 8)


//if there is only one line in the function, then you dont need the return statement
func randomNum() -> Int{
    return Int.random(in: 1...6)
}

let result = randomNum()

//return multiple values
func getUser() -> (firstName: String, lastName: String){
    return (firstName: "San", lastName: "Varshney")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

    //if you dont want both values from the tuple you can only get one and and put a underscore in the other
let (firstName, _) = getUser()
print("Name: \(user.firstName)")


//you dont have to pass in a variable that has a name
//you can use a temp one in the func (ex: string)
func isUppercase(_ string: String) -> Bool{
    return string == string.uppercased()
}

let stringUpper = "HELLO"
print(isUppercase(stringUpper))


//you can also use a different name for the parameter when calling the function (external) and another name in the funciton itself (internal).
//for example, when calling the function, we used "numpy" (external) but in the function, we used "number" (internal)
//in the function, the external goes first then internal
func timesTable(numpy number: Int){
    for i in 1...12{
        print("\(i) times \(number) equals \(i*number)")
    }
}

timesTable(numpy: 5)

//default values:
//the "= false" after the formal bool value says that if the the value for formal isnt passed in then the default value is false.
func greet(_ name: String, formal: Bool = false){
    if formal == true{
        print("Hello \(name)")
    }else{
        print("What's up \(name)")
    }
}

let nameToGreet = "Sankalp"
greet(nameToGreet, formal: true)
greet(nameToGreet) //also works, formal's default is false


//handleing errors in functions-----------------
//steps: 1)identify all the possible errors
//       2)write a function that cause error(s)
//       3)handle the error(s) in the function

    //step 1
enum PasswordErrors: Error {
    case short, obvious
}
    //step 2
    //function throws and it returns string
func checkPassword(_ password: String) throws -> String{
    if password.count < 5 {
        throw PasswordErrors.short
    }
    if password == "12345"{
        throw PasswordErrors.obvious
    }
    
    if password.count < 10{
            return "Mid"
    }else{
        return "Good"
    }
}

    //step 3
    //at the end you need a generic catch statement that'll catch all the other errors
do{
    let passwordStrength = try checkPassword("abc")
    print("Result: \(passwordStrength)")
} catch PasswordErrors.obvious{
    print("This password is too obvious.")
} catch PasswordErrors.short{
    print("Too short buddy.")
} catch{
    print("There was an error.")
}

//closures-------------------------------

//this is a closure, you can use this anywhere in your code and even pass it around
//place the parameters and return type inside the brackets
//the "in" keyword at the end indicates the end of the parameters and return type, everything past the end is the body of the closure
let sayHello = { (name: String) ->String in
    "Hi \(name)"
}

//also a closure:
let sayBye = {
    print("Bye!")
}

//example, closure is used as a filter for arrays. filter the array and make a new array with remain
    //remove the members who's name dont begin with "S"
//in filterTeam, i'm calling an in-built method for Arrays called filter and inside i'm passing in a closure that runs for every element and returns a bool whether the name ends with S.
    //side note: filter doesn't modify the original array, it creates a new one
let team = ["San", "Samuel", "Max", "Noah"]
let filteredTeam = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("S")
})
//you can also do this below by removing the return type because with filter its always Bool and the parameter type because the array already has type string
let filteredTeam2 = team.filter({ name in
      name.hasPrefix("S")
})

// Trailing closures and shorthand syntax allows you to remove the prenthesis
//$0 is a alternative for using a variable for each element in the array.
let filteredTeam3 = team.filter{ $0.hasPrefix("S")}





//Structs

struct Album{
    let title: String
    let artist: String
    var isReleased: Bool = false
    
    func printSummary(){
        print("\(title) by \(artist)")
    }
    
    //you have to "mutating" if the struct method is changing a property in the struct
    mutating func makePublic(){
        isReleased = true
    }
}

var rodeo = Album(title: "Rodeo", artist: "Travis Scott")
print(rodeo.title)
rodeo.printSummary()





//computed properties
struct Bank{
    var totalMoney = 5000
    var moneyUsed = 1000
    
    //this is computed property
        //you can get it and it'll compute the value dynamically (on the spot)
        //or you can set it
            //newValue is the value you were trying to assign to this property
    var moneyLeft: Int {
        get{
            totalMoney - moneyUsed
        }
        
        set{
            totalMoney = newValue
        }
    }
}

var bank = Bank()
bank.moneyLeft = 6000
print(bank.totalMoney) //6000 because line 349 sets it
print(bank.moneyLeft) //5000 because it's a get





//property observers
    //willSet run before the property is changed
    //didSet runs after the property is changed
struct Game{
    var score = 0 {
        willSet{
            print("score is about to change")
        }
        didSet{
            print("score is now \(score)")
        }
    }
}

var game = Game()
game.score = 5
game.score += 2
//score is about to change
//score is now 5
//score is about to change
//score is now 7



//access control----------------
//  -private: nothing outside the struct can read or write the property
//  -private(set): you can only read but not write outside the struct
//  -private(file): you can only read and write within the file
//  -public: read and write from anywhere

    //if there is a private property in the struct and you are trying to initialize the properties, you have to create a initilizer (init method)

struct BankAccount{
    var name: String
    private(set) var fund = 0 //can only read this property outside of this struct
    
    init(userName: String){
        self.name = userName
    }
    
    mutating func depositeMoney(amount: Int){
        fund += amount
    }

}

var bankAccount = BankAccount(userName: "san")
print(bankAccount.fund) //can only read



//Static properties--------------

    //with static properties, i can read them without creating a object of the struct
struct AppData{
    static let version = "1.4 beta2"
    let name = "Instagram"
}

//let appData = AppData (YOU DONT NEED THIS WHEN READING STATIC VARIABLES)
print(AppData.version) //READ IT DIRECTLY





//Classes------------------
    //classes are important because you create a new class and inherit the properties and methods from another class
    //thats how they're different from

class Employee{
    let hours: Int
    
    init(hours: Int){
        self.hours = hours
    }
    
    func printSummary(){
        print("I work \(hours) hours!")
    }
    
    func whatAmI(){
        print("I'm an Employee")
    }
    
}

class Developer: Employee{
    //the developer class is going to inherit all the properties and methods of the employee class
    func work(){
        print("I code for \(hours) hours!")
    }
    
    //if you want to change the method from the super class, then add the override
    override func whatAmI() {
        print("I'm an Employee but specifically I'm a developer!")
    }
}

//you still need to pass in hours because the parent class, also called super class, (the employee class) has a init
let sankalp = Developer(hours: 5)
sankalp.work()
sankalp.printSummary() //sankalp is a developer but has the methods from employee (developer is also                          employee)
sankalp.whatAmI() //this will print out the overriden function in the developer class

class Designer: Employee{
    var salary: Int
    
    // when you have different properties in the child class, you have to create a new init in the child class. In the init, you have to initialize the new properties in the child AND the properties from the super class using super.init(...)
    init(hours: Int, salary: Int){
        self.salary = salary
        super.init(hours: hours)
    }
    
}

//IMPORTANT, one main difference between structs and class is that classes share the same copy of data. if you change from the child then the property in the parent also gets changed. They all point to the same data. However, thats not the case in structs, the data is not shared between the structs. In the case you make a copy of a struct and change the property in the copy, then the property in the original struct will not be changed.

// you can also de-initialize a class by using "deinit". ex: deinit{ print("this class is gone") }

//functions in classes dont need the mutating keyword, you can change properties without it








//protocols----------------------------------
//define the functionalty that others follow
//the struct car at least MUST have all the functions from the protocol

protocol Vehicle{
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle{
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) miles.")
    }
    
    func openTheSunroof(){
        print("opening the sunroof")
    }
}






 



