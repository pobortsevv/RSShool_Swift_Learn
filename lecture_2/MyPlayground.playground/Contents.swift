import UIKit

//: Emums

// Basic enum

enum Movement {
	case Left
	case Right
	case Top
	case Bottom
}

let aMovement = Movement.Left

switch aMovement {
	case .Left: print("left")
	default: ()
}
if case .Left = aMovement { print ("left") }
if aMovement == .Left { print("left") }

// Enum values

enum House: String {
	case Bara = "Ours is a fury"
	case Grey = "We do not sow"
}

enum Move: Int {
	case Left = 0
	case Right = 1
	case Top = 2
	case Bottom = 3
}

// Mercury = 1 ... Neptune = 8
enum Planet: Int {
	case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

//North = "North", South = "South"
enum CompassPoint: String {
	case North, South, West, East
}

// Raw value
let Compass = CompassPoint.West
print(Compass.rawValue)


// Вызов конструктора enum, он же еще является failable initializer
// тоесть может зафейлиться, если переданного значения нет, вернется nil

let rightMove = Move(rawValue: 1 )

// Enum properties

enum Device {
	case iPhone, iPad
	var year: Int {
		switch self {
		case.iPhone: return 2007
		case.iPad: return 2010
		}
	}
}

// Enum и протоколы

protocol CustomStringConvertible {
	var description: String { get }
}

enum Trade: CustomStringConvertible {
	case Buy, Sell
	var description: String {
		switch self {
		case .Buy: return "We're buying smthg"
		case .Sell: return "We're selling smthg"
		}
	}
}
let action = Trade.Buy.description
print("This action is \(action)")

// Recursive/Indirect Types случай, когда нам надо сделать
// ссылку на самого себя

enum FileNode {
	case File(name: String)
	indirect case Folder(name: String, files: [FileNode]) // решает цикличностьы
}

//: Optional

// Равнозначные объявления:

let shortForm: Int? = Int("42")
let longForm: Optional<Int> = Int("42")

// По сути дела optional под копотом - enum, у которого два состояния
// Optional.none
// Optional.some(Wrapped) - some типа generic(Шаблон или template)

// Если мы кинем какое - то значение в init
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // converted будет типа Int?
// потому что вызвается failable init, который может кинуть nil

//: Подходы раскрытия опциональных значений

// Forced Unwrapping:
print("Forced unwrapping: \(convertedNumber!)")

// Optional Binding:
if let convertedNumber = convertedNumber {
	print("Optional Binding: \(convertedNumber)")
}

/*
guard let convertedNumber = convertedNumber else {
	return
}
*/

// Implicit Unwrapping:
var assumedString: String! // остается optional, но им можно пользоваться с другими типами
assumedString = "Автор кода абсолютно уверен, что здесь не nil"
let implicitString: String = assumedString

// Nil-Coalescing:
var numberZero: Int? = nil
var sum: Int = 20 + (numberZero ?? 0)
print(sum)
var numberOne: Int? = nil
var sum2: Int = 10 + (numberZero ?? numberOne ?? 1)
print(sum2)

// Optional Chaining:
class Person {
	var residence: Residence?
}
class Residence {
	var numberOfRooms = 1
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
	print("Has rooms \(roomCount)")
} else {
	print("no residence")
}

// Немного о протоколах:
/*
 Оператор is возвращает true если наш объект соответствует протоколу
 Оператор as? возвращает optional значение типа протокола
 Оператор as! то же самое но forced downcast без проверки компилятора
*/

// Немного об extension

// Computed Properties
extension Double {
	var km: Double { return self * 1_000.0 }
	var m: Double { return self }
	var cm: Double { return self / 100.0 }
	var mm: Double { return self / 1_000.0 }
	var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let treeFeet = 3.ft
print("Three feet is \(treeFeet) meters")

extension Int {
	mutating func square() { // mutating нужнен для структур, если мы хотим изменить self
		self = self * self
	}
}

var someInt = 3
someInt.square()
print(someInt)

