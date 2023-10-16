//: [Previous](@previous)

import Foundation

// Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

/*
 здесь представлена максимально упрощенная формула, без проверки на дурака, к примеру можно было бы добавить
 проверку на написание процентов(15 или 0,15) а так же на то является ли какой либо аргумент функции пустым или неподходящего формата с выводом сообщения об ошибке.
 */
func dividens(deposit: Double, percent: Double, depositTerm: Int) -> Double {
    let result = (deposit * (percent / 100) * Double(depositTerm)) / 365
    return result
}

let a = dividens(deposit: 10000, percent: 15, depositTerm: 180)
print(a)

//    Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
//    Добавить возможность получения названия пиццы через rawValue

enum Pizza: String {
    case fourSeasons = "Four Seasons"
    case hawaiian = "Hawaiian"
    case carbonara = "Carbonara"

    func getName() -> String {
        switch self {
        case .carbonara: return "Carbonara"
        case .fourSeasons: return "Four Seasons"
        case .hawaiian: return "Hawaiian"
        }
    }
}

let pizzaOne = Pizza.carbonara
let pizzaTwo = Pizza.fourSeasons
let pizzaThee = Pizza.hawaiian

let pizzaTest: Pizza = .carbonara
print(pizzaTest.getName())
print(pizzaTwo.rawValue)
//: [Next](@next)
