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
        if (player1TennisScore == .Love) && (player1TennisScore == player2TennisScore){
            return "Love-All"
        }

        let player1Score = tennisScoreToString[player1TennisScore]
        let player2Score = tennisScoreToString[player2TennisScore]

        return "\(player1Score)-\(player2Score)"
    }

    var player1TennisScore = TennisScore.Love
    var player2TennisScore = TennisScore.Love

    func player1Scores() {
        player1TennisScore = player1TennisScore.next()
    }

    func player2Scores() {
        player2TennisScore = player2TennisScore.next()
    }
}