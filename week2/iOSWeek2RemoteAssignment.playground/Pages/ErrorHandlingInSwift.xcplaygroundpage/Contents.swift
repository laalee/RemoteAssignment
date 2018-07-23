// Error Handling in Swift

//1.

enum GuessNumberGameError: Error {
    case wrongNumber
}

class GuessNumberGame {
    var targetNumber = 10
    
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        
        print("Guess the right number: \(targetNumber)")
    }
}

//2.

do {
    try GuessNumberGame().guess(number: 20)
} catch {
    print("Wrong Number !!")
}

