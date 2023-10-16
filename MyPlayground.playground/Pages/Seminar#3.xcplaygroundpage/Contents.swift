//: [Previous](@previous)

import Foundation

// Задачи:
// Создать массив [5, 6, -14, 25], а затем создать новую переменную с отсортированным по возрастанию ранее созданным массивом.
let a: [Int] = [5, 6, 25, 10]
let b = a.sorted(by: <)
print(b)
// Создать массив,  а затем создать переменную, в которой будет хранится ранее созданные массив, но в нем каждое значение должно быть увеличено на 5.
let c = a.map { $0 + 5 }
print(c)

// Создать массив,  а затем создать переменную, в которой будет хранится ранее созданные массив, но в нем не должно быть ни отрицательных чисел, ни числа 12, а также каждое значение должно быть увеличено в 2 раза.
let d = a.map { $0 * 2 }.filter { $0 > 0 && $0 != 12 }
print(d)
// Создать словарь, в котором ключ будет целым числом, а значение строкой
var di: [Int: String] = [:]
di[1] = "First Emelent"
di[2] = "Second Element"
di[3] = "Third Element"
di[4] = "Fourth Element"
di[5] = "Fifth Element"
di[6] = "Sixth Element"
print(di)
// Создать массив [2, 6, 25, 4, 2, 2, 10, 2], затем создать новую переменную, в которой будут те же значения, что и в ранее созданном массиве, но не должно быть повторяющихся значений.
let f: [Int] = [2, 6, 25, 4, 2, 2, 10, 2]
let g = Set(f)
print(g)

// Написать функцию, которая на вход принимает массив целых чисел, а возвращает true или false. true, если результат сложения всех чисел массива больше или равно 100, false, если меньше 100
func sumArrayWithGuard(array: [Int]) -> Bool {
    guard array.reduce(0, +) >= 100 else { return false }
    return true
}

func sumArray(array: [Int]) -> Bool {
    array.reduce(0, +) >= 100
}

print(sumArray(array: f))

// Создать переменную, в которой будет хранится замыкание, в которое передается словарь с ключом типа Int и значением типа String, а в ходе выполнения замыкания в консоль печатаются все значения словаря, ключ у которых больше 5

let closure: ([Int: String]) -> Void = {
    di in for (key, value) in di where key > 5 {
        print(value)
    }
}

// второй вариант написания данного замыкания
let closureTwo = { (dict: [Int: String]) in
    for (key, value) in dict {
        if key > 5 {
            print(value)
        }
    }
}

closure(di)
closureTwo(di)
// ________________________________________________________________________________________________________
// второй блок задач

// Задачи:
// Создать перечисление, которое имеет в виде кейсов три вида чая: зеленый, черный и фруктовый. Затем создать словарь, в котором ключ это вид чая, а значение это стоимость и заполнить этот словарь.
enum Tea: String {
    case black = "Black"
    case green = "Green"
    case herbal = "Herbal"

    func price() -> Int {
        switch self {
        case .black: return 100
        case .green: return 120
        case .herbal: return 150
        }
    }
}

var teaList: [String: Int] = [:]
teaList[Tea.black.rawValue] = Tea.black.price()
teaList[Tea.green.rawValue] = Tea.green.price()
teaList[Tea.herbal.rawValue] = Tea.herbal.price()
print(teaList)

// Написать функцию, которая на вход принимает такой же словарь, как в задании 1, а возвращает новый, который создан по следующим правилам: у фруктового чая стоимость должна быть увеличена на 30%, у черного уменьшена в 1.6 раза, а у зеленого уменьшена на 9.5%

enum TeaType {
    case black
    case green
    case herbal
}

var teaListTwo: [TeaType: Double] = [.black: 100, .green: 120, .herbal: 150]

func correctPrice(dict: [TeaType: Double]) -> [TeaType: Double] {
    var teaList: [TeaType: Double] = [:]
    for (key, value) in dict {
        switch key {
        case .herbal:
            teaList.updateValue(value + (value * 30) / 100, forKey: .herbal)
        case .green:
            teaList.updateValue(value - value * 9.5 / 100, forKey: .green)
        case .black:
            teaList.updateValue(value / 1.6, forKey: .black)
        }
    }

    return teaList
}


var dic = correctPrice(dict: teaListTwo)
print(dic)
// Написать функцию, которая на вход принимает два целочисленных массива, которые содержат координаты начала и конца отрезка соответственно. Первый элемент массива это x, а второй y. Функция должна вернуть массив, который содержит координаты середины отрезка

func middleSegment(x: [Int], y: [Int]) -> [Int] {
    guard x.count == 2 && y.count == 2 else { return [] }
    return [(x[0] + y[0]) / 2, (x[1] + y[1]) / 2]
}
// Написать функцию, которая на вход принимает массив из 4 целых чисел (если чисел меньше или больше должно вернуться nil). Функция возвращает новый массив, который состоит из 3 элементов, первый элемент это первый элемент переданного массива, второй элемент это сумма второго и третьего элемента (индексы 1 и 2) переданного массива, последний элемент это последний элемент переданного массива. Также этот массив должен быть отсортирован по убыванию.
func sumArray(arr1: [Int]) -> [Int]? {
    guard arr1.count == 4 else { return nil }
    return [arr1[0], arr1[1] + arr1[2], arr1[3]].sorted(by: >)
}
print(sumArray(arr1: a))


// Создайте массив, который состоит из всех целых чисел от 1 до 50
let arr2 = Array(1...50)
print(arr2)

// Напишите замыкание, которое принимает на вход два целых числа и возвращает их сумму, затем вызовите это замыкание
let sum = {(num1: Int, num2: Int)-> Int in num1 + num2}
print(sum(5,10))

// Напишите функцию, которая на вход будет принимать замыкание, которое на вход принимает целое число, но ничего не возвращает. Функция также не должна ничего возвращать. Внутри функции должен печататься тип замыкания

func closureType(closure: (Int)->Void){
    print(type(of: closure))
}

closureType (closure: { _ in })
closureType {_ in}

// Создать массив и при помощи forEach вывести в консоль все значения

let arr3 = [1,2,3]
arr3.forEach{print($0)}

//: [Next](@next)
