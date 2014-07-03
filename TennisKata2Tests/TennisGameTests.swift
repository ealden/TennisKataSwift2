import XCTest

class TennisGameTests: XCTestCase {
    let game = TennisGame()

    func testScoreShouldBeLoveAllIfPlayersHaveNotScored() {
        XCTAssertEqual(game.score, "Love-All")
    }

    func testScoreShouldBeFifteenLoveWhenPlayer1Scores() {
        game.player1Scores()

        XCTAssertEqual(game.score, "Fifteen-Love")
    }

    func testScoreShouldBeThirtyLoveWhenPlayer1ScoresTwice() {
        game.player1Scores()
        game.player1Scores()

        XCTAssertEqual(game.score, "Thirty-Love")
    }

    func testScoreShouldBeFortyLoveWhenPlayer1ScoresThrice() {
        game.player1Scores()
        game.player1Scores()
        game.player1Scores()

        XCTAssertEqual(game.score, "Forty-Love")
    }

    func testScoreShouldBeLoveFiftenWhenPlayer2Scores() {
        game.player2Scores()

        XCTAssertEqual(game.score, "Love-Fifteen")
    }

    func testScoreShouldBeLoveThirtyWhenPlayer2ScoresTwice() {
        game.player2Scores()
        game.player2Scores()

        XCTAssertEqual(game.score, "Love-Thirty")
    }

    func testScoreShouldBeLoveFortyWhenPlayer2ScoresThrice() {
        game.player2Scores()
        game.player2Scores()
        game.player2Scores()

        XCTAssertEqual(game.score, "Love-Forty")
    }

    func testScoreShouldBeFifteenAllWhenBothPlayersScore() {
        game.player1Scores()
        game.player2Scores()

        XCTAssertEqual(game.score, "Fifteen-All")
    }

    func testScoreShouldBeThirtyAllWhenBothPlayersScoreTwice() {
        game.player1Scores()
        game.player2Scores()

        game.player1Scores()
        game.player2Scores()

        XCTAssertEqual(game.score, "Thirty-All")
    }

    func testScoreShouldBeDeuceWhenBothPlayersScoreThrice() {
        deuce()

        XCTAssertEqual(game.score, "Deuce")
    }

    func testScoreShouldBePlayer1WinsWhenPlayer1Scores4Times() {
        game.player1Scores()
        game.player1Scores()
        game.player1Scores()
        game.player1Scores()

        XCTAssertEqual(game.score, "Player 1 Wins!")
    }

    func testScoreShouldBePlayer2WinsWhenPlayer2Scores4Times() {
        game.player2Scores()
        game.player2Scores()
        game.player2Scores()
        game.player2Scores()

        XCTAssertEqual(game.score, "Player 2 Wins!")
    }

    func testScoreShouldBeAdvantagePlayer1WhenPlayer1ScoresAfterDeuce() {
        deuce()

        game.player1Scores()

        XCTAssertEqual(game.score, "Advantage Player 1")
    }

    func testScoreShouldBeAdvantagePlayer2WhenPlayer2ScoresAfterDeuce() {
        deuce()

        game.player2Scores()

        XCTAssertEqual(game.score, "Advantage Player 2")
    }

    func testScoreShouldBeDeuceWhenPlayer1ScoresThenPlayer2ScoresAfterDeuce() {
        deuce()

        game.player1Scores()
        game.player2Scores()

        XCTAssertEqual(game.score, "Deuce")
    }

    func testScoreShouldBeDeuceWhenPlayer2ScoresThenPlayer1ScoresAfterDeuce() {
        deuce()

        game.player2Scores()
        game.player1Scores()

        XCTAssertEqual(game.score, "Deuce")
    }

    func deuce() {
        game.player1Scores()
        game.player2Scores()

        game.player1Scores()
        game.player2Scores()

        game.player1Scores()
        game.player2Scores()
    }
}
