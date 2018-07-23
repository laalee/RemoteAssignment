// Enumerations and Optionals in Swift

// 1.

enum Gasoline: String {
    case type92 = "92"
    case type95 = "95"
    case type98 = "98"
    case diesel
    
    func getPrice() -> Double {
        switch self{
        case .type92: return 28.9
        case .type95: return 30.4
        case .type98: return 32.4
        case .diesel: return 27.0
        }
    }
}

let priceOf92 = Gasoline.type92.getPrice()
let priceOf95 = Gasoline.type95.getPrice()
let priceOf98 = Gasoline.type98.getPrice()
let priceOfDiesel = Gasoline.diesel.getPrice()

Gasoline.type92.rawValue
Gasoline.type95.rawValue
Gasoline.type98.rawValue
Gasoline.diesel.rawValue

// Please explain what is enum’s ​associate value​ and how to use it.
/*
 可以把值夾帶在enum的變數中, 透過(let name)取出夾帶在enum的值.
 例如宣告一個enum Value如下, 變數夾帶著不同類型的associate value,
 一個fuction describe用來取出裡面的值.
 在使用時要傳入所需的associate value在括號中例如: Value.int(20).
 */
 enum Value {
    case int (Int)
    case string (String)
 }
 func describe(value: Value) -> String {
    switch value {
        case .int(let someInt): return "Int: \(someInt)"
        case .string(let someString): return "String: \(someString)"
    }
 }
describe(value: Value.int(20))
describe(value: Value.string("Hello"))

// 2.

// var a: Int? = 10
// a會是Int 10, 因Int?代表a可以填入Int或是nil, 如果沒有給值的話a才會是nil

// Pets and People
class Pet {
    var name: String?
}

class People {
    var pet: Pet?
}

let lucky = Pet()
lucky.name = "Lucky"

let annie = People()
let lee = People()
lee.pet = lucky

func getNameUseGuardLet(people: People) -> String? {
    guard let petName = people.pet?.name else {
        return nil
    }
    return petName
}

func getNameUseIfLet(people: People) -> String? {
    if let petName = lee.pet?.name {
        return petName
    } else {
        return nil
    }
}

getNameUseGuardLet(people: annie)
getNameUseGuardLet(people: lee)
