//: [Previous](@previous)

import Foundation

// В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
protocol Food {
    var name: String { get }
    var cost: Int { get }
}

struct Pizza: Food {
    let name: String
    var cost: Int
    var doughType: DoughType
    var pizzaType: PizzaType
    var supplements: [Supplements]

    enum DoughType { // виды теста: тонкоеТесто(thinDough), толстоеТесто(thickDough)
        case thinDough, thickDough
    }

    enum PizzaType {
        case pepperoni, carbonara, fourCheeses, hawaiian, sicilian
    }

    enum Supplements { // Добавки
        case pepperoni, tomatos, cheese, jalapenoPepper, chilliPepper
    }
}

struct PotatoFree: Food {
    let name: String
    var cost: Int
    enum Size {
        case small, medium, large
    }
}

class Pizzeria {
    var menu: [Food] = []

    init(menu: [Food]) {
        self.menu = menu
    }
    // Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
    func addFoodInShowCase(food: Food) {
        menu.append(food)
    }

    func displayAllShowCase() {
        for item in menu {
            print("Food: \(item.name) | cost: \(item.cost)")
        }
    }
}
// Создайте протокол, в котором будут содержаться функции открытия и закрытия.
protocol OpenClosed {
    func open()
    func close()
}
// Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.
extension Pizzeria: OpenClosed {
    func open() {
        print("The pizzeria is opened. Wellcome!")
    }

    func close() {
        print("The working day is over. Thanks for bying. Goodbye!")
    }
}

// Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.

func subtraction<T: Numeric>(num1: T, num2: T) -> T {
    return num1 - num2
}
var a = subtraction(num1: 10, num2: 0.5)
print(a)

//: [Next](@next)
