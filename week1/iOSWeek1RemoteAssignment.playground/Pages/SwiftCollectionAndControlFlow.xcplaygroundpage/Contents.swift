// SwiftCollectionAndControlFlow

// Array

// 1.
var myFriends: [String] = []

// 2.
myFriends += ["lan", "Bomi", "Kevin"]

// 3.
myFriends.append("Michael")

// 4.
myFriends.insert(myFriends[3], at: 0)
myFriends.remove(at: 4)

// 5.
for myFriend in myFriends {
    print(myFriend)
}

// 6.
// myFriends[5] 會crash, 因為Array的index是從0開始, myFriends總共有4個item, index分別從0~3, 所以index 5已經超出範圍了

// 7.
myFriends.first

// 8.
myFriends.last

// Dictionary

// 1.
var myCountryNumber: [String: Int] = [:]

// 2.
myCountryNumber.updateValue(1, forKey: "US")
myCountryNumber.updateValue(44, forKey: "GB")
myCountryNumber.updateValue(81, forKey: "JP")

// 3.
myCountryNumber.updateValue(0, forKey: "GB")

// 4.
var emptyDictionary1: [String: Int] = [:]
var emptyDictionary2 = [String: Int]()

// For, While, Repeat

// 1.
print("-- 1. --")
let lottoNumbers = [10, 9, 8, 7, 6, 5]
for index in lottoNumbers.count - 3..<lottoNumbers.count {
    print(lottoNumbers[index])
}

// 2.
print("- 2.1: for loop from 5 to 10 by 1")
for index in 5...10 {
    print(index)
}

print("- 2.2: for loop from 10 to 6 by -2")
for index2 in stride(from: 10, through: 6, by: -2) {
    print(index2)
}

// 3.
print("- 3.1: while loop from 5 to 10 by 1")
var index3 = 5
while index3 <= 10 {
    print(index3)
    index3 += 1
}

print("- 3.2: while loop from 10 to 6 by -2")
var index4 = 10
while index4 >= 6 {
    print(index4)
    index4 -= 2
}

// 4.
print("- 4.1: repeat while loop from 5 to 10 by 1")
var index5 = 5
repeat {
    print(index5)
    index5 += 1
} while index5 <= 10

print("- 4.2: repeat while loop from 10 to 6 by -2")
var index6 = 10
repeat {
    print(index6)
    index6 -= 2
} while index6 >= 5

// If statment
// 1.
let isRaining: Bool = true
if (isRaining) {
    print("It's raining, I don't want to work today.")
} else {
    print("Although it's sunny, I still don't want to work today.")
}

// Switch
// 1.
var jobLevel: Int = 1
switch jobLevel {
case 1: print("Member")
case 2: print("Team Leader")
case 3: print("Manager")
case 4: print("Director")
default: print("We don't have this job")
}

