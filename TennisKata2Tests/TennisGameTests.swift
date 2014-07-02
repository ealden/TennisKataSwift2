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
}
