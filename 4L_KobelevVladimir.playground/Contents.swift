import Foundation

class carClass {
    var brand: String
    var model: String
    let year: Int
   
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    enum doors: String {
        case open = "Doors are open"
        case closed = "Doors are closed"
    }
    
   
    enum turbine: String {
        case installed = "Turbine installed"
        case notInstalled = " Turbine not installed"
    }
    
    enum bodyValue {
        case full(value: Int)
        case empty(value: Int)
    }
    
    enum engine: String{
        case start = "Engine started"
        case stop = "Engine stopped"
    }
    
    enum cabrio: String{
        case openUp = "Roof is open"
        case closedUP = "Roof is closed"
    }
    
    enum tunkers: String{
        case hook = "Tunk hooked"
        case unhook = "Tunk unhooked"
    }
    
    
    func something() {
        print("car \(brand), model \(model), year \(year)")
    }
    }

class sportCar: carClass{
    var turbineSetup: String
    var engineSet: String
    var cabrioletState: String
    
    init(brand: String, model: String, year: Int, turbine: turbine, engine: engine, cabrioletState: cabrio) {
    self.turbineSetup = turbine.rawValue
        self.engineSet = engine.rawValue
        self.cabrioletState = cabrioletState.rawValue
    super.init(brand: brand, model: model, year: year)
    }
    
    func turboChange(action: turbine) {
        switch action {
        case .installed:
            print(action.rawValue)
        case .notInstalled:
            print(action.rawValue)
        }
    }
    func changeEngine(action: engine) {
        switch action {
        case .start:
            print(action.rawValue)
        case .stop:
            print(action.rawValue)
        }
    }
        func openRoof(action: cabrio) {
            switch action {
            case .openUp:
                print(action.rawValue)
            case .closedUP:
                print(action.rawValue)
            }
        }
    }
    func describeSport() {
    }




class heavyCar: carClass {
    
    var bodyFill: Int
    var tunkerState: String
    
    init(brand: String, model: String, year: Int, bodyFill: Int, tunkerState: tunkers) {
        self.bodyFill = bodyFill
        self.tunkerState = tunkerState.rawValue
        super.init(brand: brand, model: model, year: year)
    }
    func changeBody(bodyValue: bodyValue) {
        switch bodyValue {
        case .empty(let value):
            self.bodyFill += value
        case .full(let value):
            self.bodyFill -= value
        }
    }
    func hookTunker(action: tunkers) {
        switch action {
        case .hook:
            print(action.rawValue)
        case .unhook:
            print(action.rawValue)
        }
    }
}

var car1 = sportCar(brand: "Ferrari", model: "FF", year: 2014, turbine: .notInstalled, engine: .stop, cabrioletState: .closedUP)
print(car1.brand)
print(car1.model)
car1.turboChange(action: .installed)
car1.changeEngine(action: .start)
car1.openRoof(action: .openUp)
car1.cabrioletState
car1.openRoof(action: .closedUP)

var car3 = sportCar(brand: "Lotus", model: "Elise", year: 2010, turbine: .installed, engine: .start, cabrioletState: .openUp)
car3.changeEngine(action: .stop)

var car2 = heavyCar(brand: "Kamaz", model: "4320", year: 1989, bodyFill: 1000, tunkerState: .unhook)

print(car2.bodyFill)
print(car2.model)
car2.tunkerState
car2.hookTunker(action: .hook)
car2.tunkerState

var car4 = heavyCar(brand: "KRAZ", model: "2145", year: 1973, bodyFill: 500, tunkerState: .hook)
car4.hookTunker(action: .unhook)
car4.tunkerState
car4.hookTunker(action: .hook)
car4.tunkerState
