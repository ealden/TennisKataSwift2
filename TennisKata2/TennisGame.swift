import Foundation

class TennisGame {
    var score: String {
        if scored {
            return "Fifteen-Love"
        } else {
            return "Love-All"
        }
    }

    var scored = false

    func player1Scores() {
        scored = true
    }
}