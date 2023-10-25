//: [Previous](@previous)

import Foundation

// Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only

protocol costMenu {
    var nameFood: String { get }
    var cost: Int { get }
}

// Создайте класс кафе, в нем должен быть массив с наименованиями меню  и инициализатор. Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”, то есть, например, для черного чая должно быть black tea, а для зеленого green tea

struct Tea: costMenu {
    var nameFood: String {
        type.rawValue + " tea"
    }

    let type: TeaType
    internal var cost: Int

    enum TeaType: String {
        case black, green, fruit
    }

    func calculationCost(discount: Int) -> Int {
        guard discount > (cost * 50 / 100) else {
            return cost
        }
        return cost - (cost * discount / 100)
    }

    func getCost() -> Int {
        return cost
    }
}

// Добавить в класс кафе функцию, которая возвращает все позиции меню
class Cafe {
    fileprivate var menuList: [costMenu] = []

    init(menuList: [costMenu]) {
        self.menuList = menuList
    }

    func addItemInMenu(tea: costMenu) {
        menuList.append(tea)
    }

    func displayAllMenu(menu: [costMenu]) {
        for item in menu {
            print("Item : \(item.nameFood), Cost: \(item.cost)")
        }
    }

    // Добавить в класс кафе функцию, которая на основе цены возвращает массив позиции которые можно купить (Например, есть черный чай за 50, зеленый за 60, лимонад за 100 и салат за 150. Функция получае 90, значит она должна вернуть черный чай и зеленый чай)

//    func displayItemsForCost(cost: Int) -> [costMenu]{
//        var tempList: [costMenu] = []
//        for item in menuList {
//            if item.cost <= cost {
//                tempList.append(item)
//            }
//        }
//        return tempList
//    }

    func displayItemsForCost(cost: Int) -> [costMenu] {
        menuList.filter { $0.cost <= cost }
    }
}

// Создайте еще 3 кафе, для которых класс Cafe будет родительским.
// Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, если она еще таковой не является
// Сделать так, чтобы в первом из трех классов наследников(например, FirstCafe) функция add помимо того, что выполняла все тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.
class CafeOne: Cafe {
    override func addItemInMenu(tea: costMenu) {
        super.addItemInMenu(tea: tea)
        print("Cost ITEM -> \(tea.cost)")
    }
}

class CafeTwo: Cafe {
}

class CafeThree: Cafe {
}

// Создать класс автомата с едой, не реализовывать в нем ни методов, ни свойств, однако этот класс должен уметь делать все тоже самое, что и FirstCafe
// Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.

//: [Next](@next)

// Создать две структуры: лимонад и салат. Сделать так, чтобы и то и то можно  добавить в меню кафе.
struct Limonade: costMenu {
    var nameFood: String

    var cost: Int
}

struct Salad: costMenu {
    var nameFood: String

    var cost: Int
}

// Задать переменной с меню в классе Cafe уровень fileprivate

// Добавить в класс автомата с едой функцию, которая на основе полученного номера (номер элемента в массиве) и денег возвращает товар под необходимым номером, если денег хватает и nil, если денег не хватает. Если товар не найден, тоже вернуть nil
final class VendingMachine: CafeOne{
    
    func giveItems(index: Int, cash: Int) -> costMenu? {
        guard index >= 0 && index <= menuList.count else { return nil }
        let temp = menuList[index]
        guard cash < temp.cost else { return nil }; return temp
    }
}
 

    // Создать протокол, в котором будет содержаться две функции: start и final.

protocol StartFinal {
    func start()
    func final()
}
    // Для класса автомата с едой создать расширение, в котором будут содержаться функции из протокола из пункта 6 (класс должен быть подписан на протокол). В функции start должно печататься о начале работы автомата, а в final о завершении
extension VendingMachine: StartFinal{
    func start() {
        print("Hello! Machine is starting work")
    }
    
    func final() {
        print("Machine is finished work. Goodbye")
    }
    
    
}

