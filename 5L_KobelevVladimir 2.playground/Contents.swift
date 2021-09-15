import Foundation

enum engineCase {
    case start, stop
}

enum windowCase {
    case open, closed
}

enum doorsCase {
    case lock, unlock
}

enum no2 {
    case installed, not_installed
}

enum turbine {
    case installed, not_installed
}

enum bodyHook {
    case hooked, unhooked
}

protocol Car {
    var engine: engineCase { get set }
    var window: windowCase { get set }
    var doors: doorsCase { get set }
    var brand: String { get }
    var model: String { get }
    var yearOfManufactuing: Int {get}
}

extension Car {
    mutating func changeEngineState(engine: engineCase) {
    self.engine = engine
    }
    
    mutating func changeWindowState(window: windowCase) {
        self.window = window
    }
    mutating func changeDoorState(doors: doorsCase) {
        self.doors = doors
    }
}

class SportCar: Car {
    var engine: engineCase = .stop
    var window: windowCase = .closed
    var doors: doorsCase = .unlock
    var brand: String
    var model: String
    var yearOfManufactuing: Int
    let maxSpeed: Int
    var speedAtTheMomet: Int
    var turbo: turbine = .installed
    var nitro: no2 = .not_installed
    
    init(brand: String, model: String, yearOfManufacturing: Int, maxSpeed: Int) {
        self.brand = brand
        self.model = model
        self.yearOfManufactuing = yearOfManufacturing
        self.maxSpeed = maxSpeed
        self.speedAtTheMomet = 0
    }
    
}

class TrunkCar: Car {
    var engine: engineCase = .stop
    var window: windowCase = .open
    var doors: doorsCase = .unlock
    var brand: String
    var model: String
    var yearOfManufactuing: Int
    let bodyVolume: Int
    var cargoVolume: Int
    var freeBodySpace: Int {
        get {
            return bodyVolume - cargoVolume
        }
    }
    var bodyState: bodyHook = .hooked
    
    init(brand: String, model: String, yearOfManufacturing: Int, bodyVolume: Int, cargoVolume: Int) {
        self.brand = brand
        self.model = model
        self.yearOfManufactuing = yearOfManufacturing
        self.bodyVolume = bodyVolume
        self.cargoVolume = cargoVolume
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
      return "Car \(brand) \n" +
        "Model \(model) \n" +
        "Manufactured in \(yearOfManufactuing) \n" +
        "Doors are \(doors) \n" +
        "Windows are \(window) \n" +
        "Engine is \(engine) \n" +
        "Additional options nitro: \(nitro), turbine: \(turbo)"
        
    }
        func checkEngine() {
            if engine == .start {
                print("Everything ok, u can ride")
            } else {
                print("Please, start the engine")
            }
        }
    func checkDoors() {
        if doors == .lock {
            print("Doors are locked, unlocked it first")
        } else {
            print("Doors are open")
        }
    }
    func changeSpeed(speed: Int) {
        if speed + speedAtTheMomet <= maxSpeed {
            print("Accelerating")
            self.speedAtTheMomet += speed
        }else {
            var _ = maxSpeed - (speedAtTheMomet + speed)
            print("You reached max speed \(maxSpeed), cannot accelerate more")
            self.speedAtTheMomet = maxSpeed
        }
    }
    func brake(speed: Int) {
        if speedAtTheMomet >= speed {
            print("slowing down")
            self.speedAtTheMomet -= speed
        }else {
        print("Parking")
            self.speedAtTheMomet = 0
    }
}
    func useNitro() {
        if nitro == .installed {
            print("Let's ride")
        } else {
            print("Install nitro first")
        }
    }
    func turboCharge() {
        if turbo == .installed {
            print("Everything installed, let's burn tires")
        } else {
            print("Install turbines")
        }
    }
}




extension TrunkCar: CustomStringConvertible {
    
    var description: String {
      return "Car \(brand) \n" +
        "Model \(model) \n" +
        "Manufactured in \(yearOfManufactuing) \n" +
        "Doors are \(doors) \n" +
        "Windows are \(window) \n" +
        "Engine is \(engine) \n" +
        "BodyVolume \(bodyVolume)\n" +
        "Volume left \(freeBodySpace) \n"
        "Body is \(bodyState) \n"

    }
    
    func changeBody() {
        if bodyState == .unhooked {
            print("Please hook the body")
        } else {
            print("Body is hooked, everyting is ok")
        }
    }
        
    func addCargo(volume: Int) {
        
        if bodyState == .unhooked {
            print("Hook the body to start loading")
        } else if freeBodySpace >= volume {
                print("Adding cargo to body")
                self.cargoVolume += volume
            } else {
                print("Overload, can not load more")
            }
        }
    func unloadCargo(volume: Int) {
        if bodyState == .unhooked {
            print("Hook the body to start loading")
            
        }else if bodyVolume >= volume {
            print("Unloadding cargo")
            self.cargoVolume += volume
        } else {
            print("Not enough cargo in the body")
        }
        
    }
    
    }
    
var heavy1 = TrunkCar(brand: "Volvo", model: "FH16", yearOfManufacturing: 2010, bodyVolume: 5000, cargoVolume: 0)
var heavy2 = TrunkCar(brand: "KRAZ", model: "5640", yearOfManufacturing: 1983, bodyVolume: 10000, cargoVolume: 8000)

print(heavy1)
heavy1.addCargo(volume: 6000)
print(heavy1.freeBodySpace)
heavy1.bodyState = .unhooked
heavy1.bodyState = .hooked
heavy1.unloadCargo(volume: 4500)

var sport1 = SportCar(brand: "Lotus", model: "elise", yearOfManufacturing: 2005, maxSpeed: 250)
var sport2 = SportCar(brand: "Bugatti", model: "Chiron", yearOfManufacturing: 2019, maxSpeed: 450)

print(sport1)

sport1.turbo = .not_installed
sport1.changeSpeed(speed: 60)
print(sport1.speedAtTheMomet)
sport1.changeSpeed(speed: 230)
print(sport1.speedAtTheMomet)
sport1.useNitro()
sport1.nitro = .installed
sport1.useNitro()
sport1.turboCharge()
sport1.turbo = .installed
sport1.turboCharge()

print(sport1)

print(sport2)
