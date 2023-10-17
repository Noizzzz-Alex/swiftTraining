//: [Previous](@previous)

import Foundation


//
//Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить её в виде массива видов чая, которые хотят заказать).
//Необходимо последовательно выводить в консоль сколько заплатит покупатель (необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).

var teaList: [String: Int] = ["black": 100, "green": 120, "herbal": 150, "fruit": 170]
var teaQueue: [String] = ["black","herbal","fruit","black","green","herbal","green","black","black"]
teaList["black"]


func displayInfo (teaList: [String: Int], queue: [String]){
    for (index,tea) in queue.enumerated(){
        let message =
        String(format: "Order: %3d Tea: %8@ Price: %4d", index + 1, tea, teaList[tea] ?? 0)
        print (message)
    }
}
displayInfo(teaList: teaList, queue: teaQueue)





//    Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. Необходимо создать новый массив, который будет состоять из элементов старого, но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию.
let testArr = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
let newArr = testArr.compactMap{ $0 }.filter{$0 != 0 && $0 != 4}.sorted()
print(newArr)



//    Написать функцию, которая на вход принимает целое число, а возвращает массив, который сформирован по следующим правилам: количество элементов соответствует переданному числу, массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.

func testFunc(number: Int)->[Int]{
    var tempArr = [Int]();var tempI = 1
    for _ in 1...number{
        tempArr.append(tempI)
        tempI *= 2
    }
    return tempArr
}
let c = testFunc(number: 10)
print(c)

//: [Next](@next)
