import Foundation

enum sportCarDoor: String {
    case open = "Open"
    case closed = "Closed"
}

enum sportCarWindow: String {
    case winOpen = "Open"
    case winClose = "Closed"
}

enum luggageStatus{
    case full (luggage: Int)
    case empty (luggage: Int)
}
enum engineState: String {
    case start = "Start"
    case stop = "Stop"
}
enum SportBody: String {
    case sportBody = "Sport Body Kit"
    case stock = "Stock Body Kit"
}

struct sportCar {
    var brand: String
    var model: String
    var engine: String
    let year: Int
    var sportBodyKit: String
    var windows: String
    var doors: String
    var luggage: Int
    var luggageFilled: Int
    let maxLuggage = 200
    var color: String
    
   mutating func changeColor(carColor: String) {
        switch carColor {
        case "black": self.color = "black"
        case "blue": self.color = "blue"
        case "green": self.color = "green"
        default: self.color = "white"
            
        }
    }
    mutating func changeDoor(action: sportCarDoor) {
        self.doors = action.rawValue
    }
    
    mutating func changeEngine(action: engineState) {
        self.engine = action.rawValue
    }
    mutating func changeWindow(action: sportCarWindow) {
        self.windows = action.rawValue
    }
    mutating func changeBody(action: SportBody) {
        self.sportBodyKit = action.rawValue
    }
    mutating func fillingLug(action: luggageStatus) {
        switch action {
        case .full(luggage: let luggage):
            if luggage > maxLuggage {
                print("car luggage is full, some of luggage \(luggage - maxLuggage) left")
            }else {
                luggageFilled = maxLuggage - luggage
                print("Free space left \(luggageFilled)")
            }
        case .empty(luggage: let luggage):
            if luggageFilled == 0 {
                print("car luggage is free")
            }else {
                luggageFilled = luggageFilled + luggage
                print("Space left \(self.luggageFilled)")
            }
        }
    }
    func describeSport() {
        print("Car \(brand),\(model), year \(year), free space in luggage \(luggageFilled)")
    }
}

var Sport1 = sportCar(brand: "Lambo", model: "Aventador", engine: engineState.stop.rawValue, year: 2016, sportBodyKit: SportBody.stock.rawValue, windows: sportCarWindow.winOpen.rawValue, doors: sportCarDoor.closed.rawValue, luggage: 0, luggageFilled: 0, color: "white")
var Sport2 = sportCar(brand: "Pagani", model: "Zonda", engine: engineState.start.rawValue, year: 2015, sportBodyKit: SportBody.stock.rawValue, windows: sportCarWindow.winOpen.rawValue, doors: sportCarDoor.closed.rawValue, luggage: 0, luggageFilled: 50, color: "green")
//данный метод не удобен тем что в описании нужно постоянно прописывать состояние через более длинный код engine: engineState.stop.rawValue 
//print(Sport1) //проверка функций
Sport1.changeEngine(action: .start) //
Sport1.changeBody(action: .sportBody)
Sport1.changeWindow(action: .winClose)
Sport1.changeDoor(action: .open)
Sport1.fillingLug(action: luggageStatus.full(luggage: 50)) // загружаем багажник
Sport1.fillingLug(action: luggageStatus.empty(luggage: 50)) // выгружаем из багажника
//print(Sport1) //проверка действий с авто
Sport1.describeSport()
//print(Sport2)// проверка функций
Sport2.changeEngine(action: .start) //
Sport2.changeBody(action: .sportBody)
Sport2.changeWindow(action: .winClose)
Sport2.changeDoor(action: .open)
Sport2.fillingLug(action: luggageStatus.full(luggage: 70)) // загружаем багажник
Sport2.fillingLug(action: luggageStatus.empty(luggage: 30)) // выгружаем из багажника
//print(Sport2)// проверка действий с авто
Sport2.describeSport()


enum TruckEngine: String {
    case started = "Start"
    case stop = "Stop"
}

enum TruckWindow: String {
    case open = "Open"
    case closed = "Closed"
}

enum TruckDoors: String {
    case locked = "Locked"
    case unlocked = "Unlocked"
}

enum TruckLights: String {
    case on = "Light is on"
    case off = "light is off"
}
enum truckVolume {
    case full(full: String)
    case empty(empty: String)
    case loaded(kg: Double)
}


struct truckCar {
    var brandTruck: String
    var modelTruck: String
    var yearTruck: Int
    var engineTruck: TruckEngine
    var windowTruck: TruckWindow
    var doorTruck: TruckDoors
    var lights: TruckLights
    var bodyVolume: truckVolume
    
    mutating func actionEngine(action: TruckEngine) {
        switch action {
        case .stop:
            print(action.rawValue)
            self.engineTruck = .stop
        case .started:
            print(action.rawValue)
            self.engineTruck = .started
        }
    }
    mutating func actionWindow(action: TruckWindow) {
        switch action {
        case .closed:
            print(action.rawValue)
            self.windowTruck = .closed
        case .open:
            print(action.rawValue)
            self.windowTruck = .open
        }
        func printEngine() {
            print(engineTruck.rawValue)
        }
    }
    mutating func actionDoors(action: TruckDoors) {
        switch action {
        case .locked:
            print(action.rawValue)
            self.doorTruck = .locked
        case .unlocked:
            print(action.rawValue)
            self.doorTruck = .unlocked
        }
    }
    mutating func actionLights(action: TruckLights) {
        switch action {
        case .on:
            print(action.rawValue)
            self.lights = .on
        case .off:
            print(action.rawValue)
            self.lights = .off
        }
    }
    func describeTruck() {
        print("Car \(brandTruck), \(yearTruck) year, now engine is \(engineTruck), volume of body \(bodyVolume)")
    }
}

var truck1 = truckCar(brandTruck: "ZIL", modelTruck: "3350", yearTruck: 1983, engineTruck: .started, windowTruck: .closed, doorTruck: .unlocked, lights: .on, bodyVolume: .loaded(kg: 3500))

var truck2 = truckCar(brandTruck: "Kamaz", modelTruck: "New", yearTruck: 2012, engineTruck: .stop, windowTruck: .closed, doorTruck: .unlocked, lights: .on, bodyVolume: .empty(empty: "0"))

//truck1.describeTruck() // проверка
truck1.actionDoors(action: .locked)
truck1.actionEngine(action: .stop)
truck1.actionLights(action: .off)
truck1.actionWindow(action: .open)
truck1.describeTruck() // проверка изменений

truck2.actionLights(action: .off)
truck2.actionDoors(action: .locked)
truck2.actionEngine(action: .started)
truck2.actionWindow(action: .open)
truck2.describeTruck()

