import Foundation

enum engine: String {
    case on, off
}

enum window: String {
    case open, closed
}

enum doors: String {
    case locked, unlocked
}

enum NO2 {
    case installed, not_installed
}

enum TunkFill {
    case full
    case filled(value: Int)
    case empty
}


protocol Car {
    var name: String {get set}
    var engineState: engine {get set}
    var brand: String {get set}
    var manufacturing: Int {get set}
    var windowState: window {get set}
    var doorState: doors {get set}
}

extension Car {
  mutating func changeEngineState(engineState: engine) {
        self.engineState = engineState
        }
    mutating func changeDoorsState(doorState: doors) {
        self.doorState = doorState
    }
    mutating func changeWindowState(windowState: window) {
        self.windowState = windowState
    }
    
}
    
class SportCar: Car, CustomStringConvertible {
    
    var name: String
    var engineState: engine = .off
    var brand: String
    var manufacturing: Int
    var windowState: window = .closed
    var doorState: doors = .locked
    var nitroState: NO2 = .not_installed
    
    init(name: String, brand: String, manufacturing: Int) {
    self.name = name
    self.brand = brand
    self.manufacturing = manufacturing
    }
    
    var description: String {
        return "Sport Car engine is \(engineState), windows are \(windowState), doors are \(doorState), nitro is \(nitroState)"
    }

}
    
class TrunkCar: Car, CustomStringConvertible {
    var name: String
    var engineState: engine = .on
    var brand: String
    var manufacturing: Int
    var windowState: window = .open
    var doorState: doors = .unlocked
    var changeTunk: TunkFill = .filled(value: 3500)
    
    init(name: String, brand: String, manufacturing: Int) {
        self.name = name
        self.brand = brand
        self.manufacturing = manufacturing
    }
    
    var description: String {
        return "Trunk Car engine is \(engineState), windows are \(windowState), doors are \(doorState), trunk \(changeTunk)"
    }
}

var RacingCar = SportCar(name: "365 Italy", brand: "Ferrari", manufacturing: 2012)
var HeavyCar = TrunkCar(name: "New", brand: "Scania", manufacturing: 2009)

print(RacingCar.description)

RacingCar.doorState = .unlocked
RacingCar.engineState = .on
RacingCar.windowState = .open
RacingCar.nitroState = .installed
print(RacingCar)


print(HeavyCar)
HeavyCar.changeTunk = .full
HeavyCar.doorState = .locked
HeavyCar.windowState = .closed
print(HeavyCar)
