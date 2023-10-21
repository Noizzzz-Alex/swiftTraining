//: [Previous](@previous)

import Foundation
//Задачи:
//Написать функцию, которая будет решать квадратное уравнение. На вход функция получает коэффициенты a, b, c, d (ax^2 + bx+ c = d), а возвращает корни уравнения.
// Алгебра 8 класс
func quadraticEquation(a: Double, b: Double, c: Double, d: Double) -> (Double?, Double?){
    let final = c - d
    let discriminant = b * b - 4 * a * final
    
    if discriminant > 0{
        return (( -b + sqrt(discriminant) / 2 * a), (-b - sqrt(discriminant) / 2 * a))
    }else if discriminant == 0 {
        return((-b + sqrt(discriminant) / 2 * a),nil)
    }else{
        return(nil, nil)
    }
}

//Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость.

//Добавить в структуру чая функцию getCost, которая будет возвращать стоимость чая. На вход функция принимает процент скидки (только целое число), который необходимо применить к стоимости. Если скидка больше 50% напечатать в консоль о невозможности применить скидку и вернуть изначальную стоимость чая.

//Сделать тип чая вложенным типом для структуры чая.

//Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.

struct Tea {
    let type: TeaType
    private var cost: Int
    
    
    enum TeaType{
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


//Создать класс Cafe, в котором хранится массив с чаем. Переменная с массивом должна быть приватной. Значение в массив должно устанавливаться в инициализаторе
//Добавить в класс функцию, которая на вход принимает тип чая и скидку, которую нужно применить. Функция должна вернуть стоимость, которую должен заплатить покупатель. Если данного вида чая нет в массиве(меню) - вернуть nil.


//Добавить в класс Cafe функцию, которая на основе типа активности, предложенной суммы и возможной скидки возвращает доступный чая. Чай выбирается по следующим критериям: если это pupil, то доступен и черный, и зеленый, и фруктовый чай. Если это student, то только черный, а если employee, то черный и фруктовый. Если предложенной суммы хватает на все доступные виды чая, то вернуть самый дорогой. Если суммы хватает только на один, то вернуть его. Если суммы хватает на несколько доступных  видов чая, но у них одинаковая стоимость, то вернуть любой из них. Если суммы не хватает ни на один вид чая, то вернуть nil.

class Cafe{
    private var teaList:[Tea] = []
    
    init(tea: [Tea]) {
        self.teaList = tea
    }
    func findOutThePrice(tea: Tea, discount: Int) -> Int? {
        guard teaList.contains(where: {$0.getCost() == tea.getCost()}) else{
            return nil
        }
        return tea.getCost() - (tea.getCost() * discount / 100)
    }
    
//    func costByDiscountAndActivity(tea: Tea, activity: Person.Activity.TypeOfActivity, amount: Int) ->     Tea? {
//        var result: [Tea] = []
//        switch activity {
//            case .pupil:
//                result = tea.filter({$0.calculationCost(discount: Int) <= amount})
//            case .employee:
//            case .student:
//            default:
//                return nil
//        }
//    }
}





//Задачи:






//Создать класс Person, внутри которого должна быть структура Activity, внутри которой должно быть перечисление TypeOfActivity (тип активности) с тремя кейсами: pupil, student, employee. Создать переменную и явно указать ей тип “тип активности”.



class Person{
    struct Activity {
        enum TypeOfActivity {
            case pupil, student, employee
        }
    }
    
}

var disciple = Person.Activity.TypeOfActivity.pupil
print(disciple)





//: [Next](@next)
