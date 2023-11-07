//: [Previous](@previous)

import Foundation

// Создать структуру работника пиццерии.
//В ней должны быть такие свойства, как имя, зарплата и должность.
//Должностей пока может быть две: или кассир, или повар.

//Добавить в класс пиццерии массив с работниками
// Создать класс столика, в нем должны быть свойство,
//в котором содержится количество мест и функция,
//которая на вход принимает количество гостей, которое хотят посадить,
//а возвращает true, если места хватает и false, если места не хватает.
//Изначальное количество мест задается в инициализаторе.

// Добавить в класс пиццерии свойство, в котором хранится массив столиков.
//У класса столика добавить свойство, в котором хранится пиццерия,
//в которой стоит столик.
//Столики создаются сразу в инициализаторе,
//не передаются туда в качестве параметра

enum activeVacansy: UInt {
    case cook = 3000
    case cashier = 1500
}

struct Worker {
    let name: String
    var job: activeVacansy
}

class Table {
    let countOfSeats: Int
    let pizzeria: Pizzeria
    init(countOfSeats: Int, pizzeria: Pizzeria) {
            self.countOfSeats = countOfSeats
            self.pizzeria = pizzeria
        }

    func isCheckOfSeats(countClient: Int) -> Bool {
        countClient <= countOfSeats
    }
}

class Pizzeria {
    var listOfEmployees: [Worker] = []
    var listOfTables: [Table] = []
    init(listOfEmployees: [Worker]) {
        self.listOfEmployees = listOfEmployees
        listOfTables = [Table(countOfSeats: 6, pizzeria: self), 
                        Table(countOfSeats: 4, pizzeria: self),
                        Table(countOfSeats: 2, pizzeria: self)]
    }
}

//: [Next](@next)
