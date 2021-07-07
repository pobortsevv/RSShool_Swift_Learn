import UIKit

//: Замыкания или Closures

// Синтаксис замыкания
/*
	{(paramets) -> return type in
		statements
	}
*/

var names = ["John", "Bob", "Tim"]

var reveredNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
	return s1 > s2
})
print(reveredNames)
print(names)

// Или

reveredNames = names.sorted(by: {s1, s2 in return s1 > s2})
print(reveredNames)
print(names)

reveredNames = names.sorted(by: {s1, s2 in s1 > s2})
print(reveredNames)
print(names)

// Получение closure в функцию

func someFunc(closure: () -> Void) {
	//
}
//Вызов
someFunc(closure: {
	// closure body
})
someFunc() {
	// closure body
}

names.sorted() {s1, s2 in s1 > s2}
reveredNames = names.sorted {$0 > $1}
reveredNames = names.sorted(by: >)

print(reveredNames)
print(names)

// Захват значений
func makeIncrement(forIncrement amount: Int) -> () -> Int {
	var runningTotal = 0
	func incrementer() -> Int {
		runningTotal += amount
		return runningTotal
	}
	return incrementer
}
