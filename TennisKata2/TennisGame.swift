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
        let player1Score = tennisScoreToString[player1.score]
        let player2Score = tennisScoreToString[player2.score]

        if player2.score == .Win {
            return "Player 2 Wins!"
        }

        switch (player1.score, player2.score) {
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

    var player1 = Player()
    var player2 = Player()

    func player1Scores() {
        score(&player1, against: &player2)
    }

    func player2Scores() {
        score(&player2, against: &player1)
    }

    func score(inout player: Player, inout against otherPlayer: Player) {
        if (player.score == .Forty) && (otherPlayer.score != .Forty) && (otherPlayer.score != .Advantage) {
            player.score = .Win
        } else if (player.score == .Advantage) && (otherPlayer.score == .Forty) {
            player.score = .Win
        } else {
            player.score = player.score.next()
        }

        if (player.score == .Advantage) && (player.score == otherPlayer.score) {
            player.score = player.score.next()
            otherPlayer.score = otherPlayer.score.next()
        }
    }
}

class Player {
    var score = TennisGame.TennisScore.Love
}