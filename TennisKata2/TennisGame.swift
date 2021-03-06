import Foundation

class TennisGame {
    var score: String {
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
            return "\(player1.playerScore)-All"
        case (.Forty, .Forty):
            return "Deuce"
        default:
            return "\(player1.playerScore)-\(player2.playerScore)"
        }
    }

    var player1 = Player()
    var player2 = Player()

    func player1Scores() {
        player1.scores(against: player2)
    }

    func player2Scores() {
        player2.scores(against: player1)
    }
}

class Player {
    enum Score: String {
        case Love = "Love"
        case Fifteen = "Fifteen"
        case Thirty = "Thirty"
        case Forty = "Forty"
        case Advantage = "Advantage"
        case Win = "Win"

        func next() -> Score {
            switch self {
            case .Love:
                return .Fifteen
            case .Fifteen:
                return .Thirty
            case .Thirty:
                return .Forty
            case .Forty:
                return .Advantage
            default:
                return self
            }
        }
    }

    var score = Score.Love

    var playerScore: String {
        return score.toRaw()
    }

    func scores() {
        score = score.next()
    }

    func scores(against otherPlayer: Player) {
        switch (score, otherPlayer.score) {
        case (.Forty, .Love), (.Forty, .Fifteen), (.Forty, .Thirty):
            win()
        case (.Advantage, .Forty):
            win()
        case (.Forty, .Advantage):
            otherPlayer.score = .Forty
        default:
            scores()
        }
    }

    func win() {
        score = .Win
    }
}