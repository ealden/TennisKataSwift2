import Foundation

class TennisGame {
    var score: String {
        switch player1Score {
        case 0:
            return "Love-All"
        case 1:
            return "Fifteen-Love"
        case 2:
            return "Thirty-Love"
        case 3:
            return "Forty-Love"
        default:
            return "Invalid"
        }
    }

    var player1Score = 0

    func player1Scores() {
        player1Score += 1
    }
}