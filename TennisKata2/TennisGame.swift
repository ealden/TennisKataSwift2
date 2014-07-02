import Foundation

class TennisGame {
    enum TennisScore {
        case Love
        case Fifteen
        case Thirty
        case Forty
    }

    var score: String {
        switch player1Score {
        case .Love:
            return "Love-All"
        case .Fifteen:
            return "Fifteen-Love"
        case .Thirty:
            return "Thirty-Love"
        case .Forty:
            return "Forty-Love"
        default:
            return "Invalid"
        }
    }

    var player1Score = TennisScore.Love

    func player1Scores() {
        switch player1Score {
        case .Love:
            player1Score = .Fifteen
        case .Fifteen:
            player1Score = .Thirty
        case .Thirty:
            player1Score = .Forty
        default:
            player1Score = .Forty
        }
    }
}