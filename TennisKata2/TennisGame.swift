import Foundation

class TennisGame {
    enum TennisScore {
        case Love
        case Fifteen
        case Thirty
        case Forty
        case Win

        func next() -> TennisScore {
            switch self {
            case .Love:
                return .Fifteen
            case .Fifteen:
                return .Thirty
            case .Thirty:
                return .Forty
            case .Forty:
                return .Win
            case .Win:
                return .Win
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
        let player1Score = tennisScoreToString[player1TennisScore]
        let player2Score = tennisScoreToString[player2TennisScore]

        if player1TennisScore == .Win {
            return "Player 1 Wins!"
        } else if player2TennisScore == .Win {
            return "Player 2 Wins!"
        } else if player1TennisScore == player2TennisScore {
            if player1TennisScore == .Forty {
                return "Deuce"
            } else {
                return "\(player1Score)-All"
            }
        } else {
            return "\(player1Score)-\(player2Score)"
        }
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