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
}
