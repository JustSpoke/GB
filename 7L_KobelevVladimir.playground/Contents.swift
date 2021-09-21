import Foundation

enum CustomerError: Error {
    case notEnoughMoney
    case noSuchCarInStock
}

struct Car {
    var price: Int
    var inStock: Int
    var model: String
}

class CarShop {
    var money = 1000000

    var carList = [
        "Ferrari" : Car(price: 1500000, inStock: 3, model: "F365"),
        "Lotus" : Car(price: 300000, inStock: 1, model: "Elise"),
        "Lamborghini" : Car(price: 1100000, inStock: 0, model: "Huracan"),
        "Zonda" : Car(price: 1200000, inStock: 5, model: "Paginini))"),
        "Honda" : Car(price: 50000, inStock: 9, model: "Civic"),
        "Toyota" : Car(price: 90000, inStock: 2, model: "Supra")]

    func buyACar(named: String) throws {
        guard var car = carList[named] else {
        throw CustomerError.noSuchCarInStock
    }
    guard car.inStock > 0 else {
        throw CustomerError.noSuchCarInStock
    }
        guard car.price <= money else {
            print("Not enough money")
            throw CustomerError.notEnoughMoney
        }

        money -= car.price
        car.inStock -= 1
        carList[named] = car
        print("Congratulations, u bought a car: \(named) \(car.model)")
}
}

let newCar = CarShop()
try? newCar.buyACar(named: "Lamborghini") //проверка опционала
newCar.money
newCar.carList
newCar.carList.count
try newCar.buyACar(named: "Lotus") //может привести к падению если будет ошибка, лучше не использовать
newCar.money
//try! carShop.buyACar(named: "Lotus") //принудительное разворачивание, краш гарантирован


do { // как говорил Пучков: План надежный, как щвейцарские часы!
    try newCar.buyACar(named: "Ferrari")
} catch CustomerError.noSuchCarInStock {
    print("We are sorry, no such car in stock")
} catch CustomerError.notEnoughMoney {
    print("We are sorry, u have not enough money")
}
