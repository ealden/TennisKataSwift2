import Foundation

class TennisGame {
    enum TennisScore {
        case Love
        case Fifteen
        case Thirty
        case Forty
        case Advantage
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
                return .Advantage
            case .Advantage:
                return .Forty
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

        if player2TennisScore == .Win {
            return "Player 2 Wins!"
        }

        switch (player1TennisScore, player2TennisScore) {
        case (.Win, _):
            return "Player 1 Wins!"
        case (_, .Win):
            return "Player 2 Wins!"
        case (.Advantage, _):
            return "Advantage Player 1"
        case (_, .Advantage):
            return "Advantage Player 2"
        case (.Love, .Love), (.Fifteen, .Fifteen), (.Thirty, .Thirty):
            return "\(player1Score)-All"
        case (.Forty, .Forty):
            return "Deuce"
        default:
            return "\(player1Score)-\(player2Score)"
        }
    }

    var player1TennisScore = TennisScore.Love
    var player2TennisScore = TennisScore.Love

    func player1Scores() {
        player1TennisScore = score(player1TennisScore, against: player2TennisScore)

        checkIfDeuce()
    }

    func player2Scores() {
        player2TennisScore = score(player2TennisScore, against: player1TennisScore)

        checkIfDeuce()
    }

    func score(playerTennisScore: TennisScore, against otherPlayerTennisScore: TennisScore) -> TennisScore {
        if (playerTennisScore == .Forty) && (otherPlayerTennisScore != .Forty) && (otherPlayerTennisScore != .Advantage) {
            return .Win
        } else {
            return playerTennisScore.next()
        }
    }

    func checkIfDeuce() {
        if (player1TennisScore == .Advantage) && (player1TennisScore == player2TennisScore) {
            player1TennisScore = player1TennisScore.next()
            player2TennisScore = player2TennisScore.next()
        }
    }
}