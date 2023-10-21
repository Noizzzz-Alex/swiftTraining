//: [Previous](@previous)

import Foundation



//Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)
//Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.

struct Pizza {
    var cost: Int
    var doughType: DoughType
    var pizzaType: PizzaType
    var supplements: [Supplements]
    
    enum DoughType {    // виды теста: тонкоеТесто(thinDough), толстоеТесто(thickDough)
       case thinDough, thickDough
    }
    enum PizzaType{
        case pepperoni, carbonara, fourCheeses, hawaiian, sicilian
    }
    enum Supplements{   // Добавки
        case pepperoni, tomatos, cheese, jalapenoPepper, chilliPepper
    }
    
    init(cost: Int, doughType: DoughType, pizzaType: PizzaType, supplements: [Supplements]) {
            self.cost = cost
            self.doughType = doughType
            self.pizzaType = pizzaType
            self.supplements = supplements
        }
    
}
//Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
//Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
class Pizzeria{
    private var pizzaList: [Pizza] = []
    
    func getPizzaList()->[Pizza]{
        return self.pizzaList
    }
    
    init(pizzaList: [Pizza]) {
        self.pizzaList = pizzaList
    }
    
    func addNewPizza(pizza: Pizza){
        pizzaList.append(pizza)
    }
    
    func displayAllPizzaVoid(list: [Pizza]){    //Первый вариант написания метода
        for pizza in list { print(pizza.pizzaType) }
    }
    
    func displayAllPizzaArray(list: [Pizza]) -> [Pizza]?{   //Второй вариант написания метода
        var tempArray: [Pizza] = []
        guard !list.isEmpty else { return nil }
        tempArray = list.map{$0}
        return tempArray
    }
}



//Создать экземпляр класса пиццерии и добавить в него несколько пицц.

let pizzaPepperoni = Pizza(cost: 10, doughType: .thinDough, pizzaType: .pepperoni, supplements: [.pepperoni, .cheese])
let pizzaCarbonara = Pizza(cost: 12, doughType: .thickDough, pizzaType: .carbonara, supplements: [.tomatos, .cheese])
let pizzaHawaiian = Pizza(cost: 15, doughType: .thinDough, pizzaType: .hawaiian, supplements: [.cheese, .jalapenoPepper])

var pizzeriaMario = Pizzeria(pizzaList: [])
pizzeriaMario.addNewPizza(pizza: pizzaPepperoni)
pizzeriaMario.addNewPizza(pizza: pizzaHawaiian)
pizzeriaMario.addNewPizza(pizza: pizzaCarbonara)

pizzeriaMario.displayAllPizzaVoid(list: pizzeriaMario.getPizzaList())

//: [Next](@next)
