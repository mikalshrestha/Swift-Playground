import UIKit

//.......Basic swift playground.....................//

//variables and constants

var str = "Hello, playground"
print(str)
var str1 = "I am practicing swift"
print(str+str1)

//Reassigning vslue to variables
str = "Hello, "
print(str+str1)  //if we concat diff types then we use \(varName)


let const = 30
print(const)

//const=40 can't assign coz it's constant


//Data Types

/* int, Float, Double, Bool*/  //primitives data types

var var1: Int = 10
var var2: String = "Hello World!!!"
var var3: Double = 0.1
var var4: Float = 0.4
var var5 = 0.5 //by default double type in swift

var var6: Bool = true

if var6 {
    print("I am TRUE!!!")
}

//Decision statement

//if else condition

var obtainedMarks: Int = 65

if obtainedMarks > 90 {
    print("Congratulations got a grade A")
}
else if (obtainedMarks >= 60 && obtainedMarks <= 90){
    print("Congratulations you got a grade B")
}
else{
    print("You got a grade C")
}

//switch statement

let switchString: String = "switch"

switch switchString {
case "notswitch":
    print("I am not under switch statement")
    
case "switch":
    print("I am under switch statements")
default:
    print("I am default statement")
}

//Control Flow

//for loops

for i in 1...5{
    print("Hello Loops")
}

for i in 1...5 {
    print(i)
}

//while loops

var square = 0
var finalSquare = 5
while square < finalSquare {
    print("Move")
    square += 1
}

//repeat while

//repeat {
//
//}
//while condition {
//    <#code#>
//}


//Collection Types

//Arrays

let a = ["aaa", "bbb", "cccc"]

//print(a)

for i in a {
    print(i)
}
//accessing arrays
//print(a[0])
//print(a[1])

//insertig into arrays

//a.append("ddd") //can't possible bcoz a is a const need to change to var if we need to insert or update the array
//print(a)

//Set
//Set is a collection of similar data types elements where order doesnot matter
//Similar to array but no defined order and are uniques

//declaring set
var setVar: Set<String> = ["setA, setB,setC"]
print(setVar)

//Dictionary

//stored in key value pair
//declaring dictionary

var dictVar = [String: String]()
//insert and update
dictVar["key"] = "Value"
//print(dictVar)

//accessing
print(dictVar["key"])

//removing

//dictVar["key"] = nil

//classes and fucntions

class Student{
    
//    var firstName: String = "Mikal"
//    var lastName: String = "Shrestha"
//    var age: Int = 22
//    var height: Double = 5.5
    
    var firstName: String
    var lastName: String
    var age: Int
    var height: Double
    
    init(_firstName: String, _lastName: String, _age: Int, _height: Double) {
        firstName = _firstName
        lastName = _lastName
        age = _age
        height = _height
    }
    
    func getInfo() -> Void {

        print("Get Info called!!!!!")
    }
    
    func getFirstAndLastName() -> String {
        
        return firstName + lastName
    }
    
    func findDOB(thisYear: Int) -> Int {
        
        return thisYear - age
    }
    
}
let stdObj = Student(_firstName: "Mikal", _lastName: "Shrestha", _age: 22, _height: 5.5)
stdObj.getInfo()
print(stdObj.getFirstAndLastName())
print(stdObj.findDOB(thisYear: 2021))


//initializers(constuctor in java)
//used to initialize the instance of class
//init()
//default and parameterized

//Optionals(?)

//Optionals is like a wrapped(closed) box: may or maynot have data inside it

//declaring optional

var title: String?
var body: String?

class Author{
    
    var authorName = ""
}

class ClassB{
    
    var title: String?
    var body = "BODY"
    var author: Author? // In some case ClassB don't need an author properties, in that case app will crash if we don't handle this case..........
    
}

//we need this optional concept in swift for the type safety it gives a compile time error rather than runtime crash
//for accesing those optional types properties we need to first unwrap and it's called as optional binding.

//Optional handling(if let, guard let, optional chaining)

//Using if let

let classBObj = ClassB()

classBObj.title = "Swift"
if let actualTitle = classBObj.title{
    print(actualTitle + "  " + "Programming")
}

//force unwrap

print(classBObj.title! + "Programming")

//nil check

if classBObj.title != nil {
    print(classBObj.title!)
}

//guard let

func guardLetExample(_number: Int?){
    guard let number = _number else {
        print("Exiting Functions!!!")
        return
    }
    print("Do Task!!!!")
}
guardLetExample(_number: 25)


//Protocol and extensions

//protocol is basically like a interface in java
//extension class is a extension version of already used class with same name : Generally used for implementing extra methods without affecting the pre-defined class
//extension concept helpful for implementing protocols

public protocol Engine{
    func getEngine()
}

class Car{
    
    var numOfTyres: Int
    var numOfSeats: Int
    
    init(numOfTyres: Int, numOfSeats: Int) {
        
        self.numOfTyres = numOfTyres   //same variables and argument name so we use self (like this in java)
        self.numOfSeats = numOfSeats
    }
    
    func getTyresAndSeats() -> Void {
        
        print("Printing number of tyres and seats \(numOfTyres) and \(numOfSeats) " )
    }
    
    
}

let carObj = Car(numOfTyres: 4, numOfSeats: 10)
carObj.getTyresAndSeats()

//Now  if we need to implemet the Engine protocol in this car, we can do same on this class but implementing in a extension car class gives a clean way to impl

extension Car: Engine{
    func getEngine() {
        print("Printing engine of a car.......")
    }
}

//We can call this getEngine Method with help of extension class
carObj.getEngine()


//Delegate
//Delegate pattern responsible for providing some responsibilities to another class.

//...........Delegate and protocol example implementation..........//

protocol AdvancedLifeSupport{
    func performCPR()
}


class EmergencyCallhandler{
    var delegate: AdvancedLifeSupport?
    
    func otherFunction(){
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmergencyCallhandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The Paramedic does operation....")
    }
}

class Doctor: AdvancedLifeSupport{
    init(handler: EmergencyCallhandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Doctor does the operation.....")
    }
    
    func anotherFunctionOfDoctor(){
        print("Doing another jobs.....")
    }
}

class Nurse: Doctor{
    
    override func performCPR() {
        print("Nurse does the operation......")
    }
    
}

let callHandler = EmergencyCallhandler()
//let paramedic = Paramedic(handler: callHandler)
//let paramedic = Doctor(handler: callHandler)
let paramedic = Nurse(handler: callHandler)

callHandler.otherFunction()
callHandler.medicalEmergency()






//struct vs class

//inheritance not supported in struct vs supported
//immutable vs mutable
//pass by value vs pass by reference


//Error handling

/* Keywords: do, try, catch, throw, throws*/

//let x = 0
//let y = 100

//Division by zero gives an error so we must handle this types of condition so we use different handling keywords to handle this types of situation

//do{
//    let divResult = try y/x
//    //print(divResult)
//}
//catch{
//    print("Caught Error")
//}


//func tryCatchExampleMethod( y: Int, x: Int) throws{
//
//    do{
//        let divResult =  try y/x
//        //print(divResult)
//    }
//    catch{
//        print("Caught Error")
//    }
//}
//tryCatchExampleMethod(y: 10, x: 0)



















































































































































































































































































