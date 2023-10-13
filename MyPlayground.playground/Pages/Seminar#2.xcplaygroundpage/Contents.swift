//: [Previous](@previous)

import Foundation

//Задачи:
//Написать функцию, которая на вход принимает число типа Int, а возвращает, является ли число четным
//func isEven(value: Int) -> Bool{
//    guard (value % 2 == 0) else{
//        return false
//    }
//    return true
//}
//
//var a = 4
//var b = isEven(value: a)
//print(b)


//Написать функцию, которая на вход принимает 3 числа: a, b, c и возвращает результат вычисления b^2 - 4 * a * c
//func math (valueA: Int,valueB: Int, valueC: Int) -> Int{
//    valueB * valueB - 4 * valueA * valueC
//}
//var result = math(valueA: 2, valueB: 10, valueC: 5)
//print(result)

//Написать функцию, которая рассчитает площадь прямоугольника. На вход два параметра: длина и ширина, на выход: площадь
//func sqareRectangle (length : Int, width : Int) -> Int{
//    length * width
//}
//print(sqareRectangle(length: 10, width: 15))
//
////Напишите функции, которая на вход принимает целое положительное число, а возвращает сумму всех чисел от 1 до переданного числа
//func sumRange (pivot : UInt) -> UInt{
//    var result :UInt = 0
//    for i in 1...pivot{
//        result += i
//    }
//    return result
//}
//var a = sumRange(pivot: 25)
//print(a)
//
////Создать опционал с типом Int и создать еще одну переменную, которая содержит значение первой переменной, но не является опционалом.  Сделать это необходимо 2 способами: при помощи force unwrapping,  nil coalescing
//let valA: Int? = 5
//let b1 = valA!
//let c1 = valA ?? 10
//

//Задачи:
//Создать перечисление, которое имеет в виде кейсов два вида чая: зеленый и черный
//enum Tea{
//    case black
//    case green
//}
//Задать для кейсов названия “Black tea” и “Green tea”
enum Tea:String{
    case black  = "Black Tea"
    case green  = "Green Tea"
    
    func color() -> String{
        switch self{
        case .black : return "black"
        case .green : return "green"
        }
    }
}
let a : Tea = .black
print(a.color())
//Написать внутри перечисления функцию, которая будет возвращать цвет чая в строковом формате, то есть, если это blackTea, то black, а если greenTea, то green

//Создать переменную с типом созданного перечисления, а затем при помощи print вывести цвет чая

//Написать функцию, которая на вход принимает параметр типа Tea, но который является опционалом. Функция должна печатать название чая, если значение есть и “Данный вид чая не найден”, если значение nil. Написать функцию нужно в 2 вариантах: используя guard let, используя if let

func someFuncGuard(tea: Tea?){
    guard let tea else{
        print("Данный вид чая не найден")
        return
    }
    print(tea.rawValue)
}

func someFuncIf(tea: Tea?){
    if let tea{
        print(tea.rawValue)
    }else{
        print("Данный вид чая не найден")
    }
}
//: [Next](@next)

