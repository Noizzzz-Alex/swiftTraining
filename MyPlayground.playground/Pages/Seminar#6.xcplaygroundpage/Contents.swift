//: [Previous](@previous)

import Foundation

// Задачи:
// Создайте переменную “a”, в которой будет хранится массив с Tea. Создайте другую переменную “b” и присвойте ей переменную “a”. Выведете в консоль адреса массивов. Затем в “b” добавьте еще один элемент. Выведете в консоль адреса массивов. Объясните полученный результат (можно рядом в комментарии)
protocol costMenu {
    var nameFood: String { get }
    var cost: Int { get }
}

struct Tea: costMenu{
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

func getAddress(_ collection: UnsafeRawPointer) {
    print(Int(bitPattern: collection))
}

var a: [Tea] = [Tea(type: .black, cost: 50)]
var b = a
getAddress(a)
getAddress(b)

b.append(Tea(type: .fruit, cost: 100))

getAddress(a)
getAddress(b)
/*
 одинаковые адреса говорят о том что они ссылаются на один и тот же участок памяти благодаря Copy - On_write, который копирует поведение ссылочных типов данный для значимых типов но до первого изменения. Т.е пока они идентичны они будут ссылаться на один и тот же участок памяти, но как только произойдет измненение то создатся новый объект значимого типа и займет другой участок в памяти, от этого и разные адреса.
 */

// Создайте класс, в котором будет одна переменная “test” типа String. Создайте экземпляр класса (название переменной, например, c). Создайте еще одну переменную (название переменной, например, d) и присвойте ей c. В переменной d измените “test”. Выведите в консоль “test” для c и d. Объясните результат
class Test {
    let test: String
    init(test: String) {
        self.test = test
    }
}

var c = Test(test: "test")
var d = c
d = Test(test: "apple")
print(c.test)
print(d.test)
/*
 так как класс это ссылочный тип данных то каждый экземплар класса будет использовать одну и ту же ссылку. Т.е при присвоении значения переменной сохраняется ссылка на тот же экземпляр.
 */

// Создайте структуру, в котором будет одна переменная “test” типа String. Создайте переменную, в которой будет лежать структура (название переменной, например, e). Создайте еще одну переменную (название переменной, например, f) и присвойте ей e. В переменной f измените “test”. Выведите в консоль “test” для e и f. Объясните результат

struct Test1 {
    var test: String
}

var e = Test1(test: "Test1")
var f = e
f = Test1(test: "random")

print(e.test)
print(f.test)
/*
  в этом примере переменные е и f поначалу благодаря copy-on-write имитируют ссылочный тип данных и пока они идентичны они ссылаются на одну область памяти
 */

// Создайте класс магазина. В нем должно быть два массива, один с товарами, второй с работниками. Для работников создайте свою структуру, а для товаров свою. Для товаров должно быть минимум 3 разных структуры, например, еда, напитки и одежда. Добавить в класс функцию, которая будет добавлять работника в массив. Написать функцию, которая будет добавлять новый товар в массив.
// Создать класс владельца магазина. Добавить в него свойство, в котором будет хранится магазин, которым он владеет. А в класс магазина добавить переменную, в которой будет хранится владелец магазина. Ответьте на вопрос: Есть ли в такой связке магазин -> директор и директор -> магазин какая-то проблема? Если да, то какая и как ее решить?
class MasterOfShop{
    let name: String
    weak var shop: Shop?
    init(name: String, shop: Shop? = nil) {
        self.name = name
        self.shop = shop
    }
}
class Shop {
    init(master: MasterOfShop, products: [Product], employees: [Employee]) {
        self.master = master
        self.products = products
        self.employees = employees
    }
    
    var master: MasterOfShop
    struct Product {
        struct Food {
            let name: String
            var cost: Double
        }

        struct Drinks {
            let name: String
            var cost: Double
        }

        struct Cloth {
            let name: String
            var cost: Double
        }
    }

    struct Employee {
        let name: String
        var jobTitle: String
    }

    var products: [Product] = []
    var employees: [Employee] = []

    func addNewProduct(product: Product) {
        products.append(product)
    }

    func addNewEmployee(employee: Employee) {
        employees.append(employee)
    }
}
var master = MasterOfShop(name: "Alex")
var chop1 = Shop(master: master, products: [], employees: [])
/*
 в данном примере переменные классов Магазин и владелец магазина держали бы друг друга сильными ссылками и из-за этого память не могла бы быть очищена, поэтому в классе Владельца магазина ссылка на магазин была сделана слабой.
 */

// _______________________________________________________________________________________

// Задачи:
// С прошлого семинара есть класс Cafe, в котором есть переменная menu, в которую можно добавлять и чай, и лимонад, и салат. Необходимо добавить в структуру чая свойство температуры. Написать функцию в классе Cafe, которая выведет температуру всех Tea из переменной menu.



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
    struct Tea: costMenu{
        var temperature: Int
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
}

    
    // Добавить в  ранее созданный класс магазина свойство, в котором будет хранится Cafe. Сделать так, чтобы все свойства класса магазина (массив товаров и работников, владелец магазина и кафе) устанавливались в инициализаторе, но в инициализатор передается только массив товаров и работников, а также владелец магазина. Кафе создается внутри инициализатора
    
    // Добавить в класс кафе свойство, в котором будет хранится владелец кафе. Значение свойству должно устанавливаться в инициализаторе. Когда в классе магазина создается Cafe - владелец и у магазина и у кафе должен быть один.
    
    // Написать в классе магазина функцию, которая возвращает меню кафе в виде словаря [<что это>: [массив позиций]], например, в меню есть [чай, чай, лимонад, салат, салат], а вернуть функция должна [“tea”: [чай, чай], “lemonade”: [лимонад], “salad”; [салат, салат] ]. Если для позиции ничего нет (например, нет ни одного лимонада), под ключом должен вернуться пустой массив
    
    // Добавить в класс магазина функцию, которая на основе словаря из предыдущего задания возвращает словарь с теми же ключами, но вместо массива позиций должен быть массив стоимостей этих позиций
    
