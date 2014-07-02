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

    let tennisScoreToString = [
        TennisScore.Love: "Love",
        .Fifteen: "Fifteen",
        .Thirty: "Thirty",
        .Forty: "Forty"
    ]

    var score: String {
        if player1TennisScore == .Love {
            return "Love-All"
        }

        if let player1Score = tennisScoreToString[player1TennisScore] {
            return "\(player1Score)-Love"
        } else {
            return "\(TennisScore.Forty)-Love"
        }
    }

    var player1TennisScore = TennisScore.Love

    func player1Scores() {
        player1TennisScore = player1TennisScore.next()
    }
}