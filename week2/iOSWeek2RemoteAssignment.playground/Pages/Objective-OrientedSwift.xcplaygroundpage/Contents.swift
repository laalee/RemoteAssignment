// Objective-Oriented Swift

// 1.
enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    let gender: Gender
    
    init(gender: Gender) {
        self.gender = gender
    }
    
    func eat() {
        print("I eat everything!")
    }
}

let animal = Animal(gender: Gender.female)
animal.gender
animal.eat()


// 2.
class Elephant: Animal {
    override func eat() {
        print("I eat cabbage, lettuce, sugar cane, apples, and bananas.")
    }
}

class Tiger: Animal {
    override func eat() {
        print("I eat meat.")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat pasture grass and tender plants.")
    }
}

let elephant = Elephant(gender: Gender.male)
let tiger = Tiger(gender: Gender.female)
let horse = Horse(gender: Gender.undefined)

elephant.eat()
tiger.eat()
horse.eat()

// 3.
class Zoo {
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let zoo = Zoo(weeklyHot: Tiger(gender: Gender.female))
zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

zoo.weeklyHot

// 4. What have you learned in ​Object-Oriented Swift​ session ?
// Struct和Class的使用, 包含宣告裡面的變數, 方法, 初始化.
// 也可以宣告sub-class繼承superclass, 並且重寫裡面的方法.
// 最後建立實例來使用. 將傳遞分為value type​ 和 reference type​兩種.

// 5. What is the difference between ​Struct​ and ​Class​ ?
/*
 (1). Struct會自己建init(),可以省略不寫,
      Class需要自己寫init()
 (2). Class pass by reference, 所以修改其中一個實例的變數時會影響另一個實例.
      Struct pass by value, 傳遞的是copy後的值而已, 兩個實例的值不會互相影響.
 (3). 宣告Struct實例時, 使用let宣告的實例不能再修改裡面的變數. 使用var宣告的實例可以修改變數.
      宣告Class實例時, 使用let和var宣告的實例都可以修改裡面的變數.
 */

// 6. What is the difference between ​instance method​ and ​type method​ ?
// instance method​ 宣告語法與一般的function一樣, 但使用時一定要使用實例呼叫, 不能直接呼叫. 存取或修改的是實例中的變數.
// type method 宣告class的type method時須在func關鍵字前面加上class, 宣告struct和enum的type method時加上static. 使用型別來呼叫方法而不是實例. 改變的是型別中定義的變數, 所有的實例都會受到影響.

// 7. What does ​Initilizer​ do in class(struct) ?
// 初始化該實例型別所需的變數, 將收到的參數賦值給相應的變數.


// 8. What does ​self​ means in instance method ?
// 指的是該型別本身, 可以用來分辨要使用的是自己的變數還是傳遞來的參數.

// 9. What is the difference between ​reference type​ and ​value type​ ?
// value type​ 在記憶體中儲存的是實際的值(value),
// reference type 在記憶體中則是儲存所指向的目標, 而不是本身的值.

