import UIKit

//: Swift Lecture part 1
/// classes vs structures

class SurveyQuestion {
    
    var text: String
    var response: String?
    
    init (text: String) {
        self.text = text
    }
}

/*
 default инциализаторы есть и у класса и у структуры
 Но если какие - то поля(Класс), значения, которых мы не определили, то
 нужно писать кастомный инициализатор
 
 Структура получает memberwise инициализатор:
 */
struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

let twoByTwo = Size(width: 2, height: 2)


// Так же у swift есть дилигирующие или вспомогательные инициализаторы:
// По правила дилигации, любой convenience init должен заканчиваться
// designated init - то есть основным

class Place {
    var origin: Point
    var size: Size
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    convenience init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


// failable init

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {return nil}
        self.species = species
    }
}

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

struct A {
    var value: Int = 89
}

var kek = A(value: 89)
var lol = A(value: 100)


lol = kek

//print(lol)

/*
 Property - по факту это поле структуры/класса, например, так выглядят
 setter и getter в swift
 */

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
square.center = Point(x: 15.0, y: 15.0)
print(square.center)

// Property read-only, то есть без сеттера

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
print("the volume is: \(fourByFiveByTwo)")


// Property observers - наблюдатели изменений переменных

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set total steps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360
