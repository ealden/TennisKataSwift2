import Foundation

class TennisGame {
    enum TennisScore {
        case Love
        case Fifteen
        case Thirty
        case Forty

        func next() -> TennisScore {
            switch self {
            case .Love:
                return .Fifteen
            case .Fifteen:
                return .Thirty
            case .Thirty:
                return .Forty
            default:
                return .Forty
            }
        }
    }

    var score: String {
        switch player1TennisScore {
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

    var player1TennisScore = TennisScore.Love

    func player1Scores() {
        player1TennisScore = player1TennisScore.next()
    }
}