import XCTest

class TennisGameTests: XCTestCase {
    let game = TennisGame()

    func testScoreShouldBeLoveAllIfPlayersHaveNotScored() {
        XCTAssertEqual(game.score, "Love-All")
    }
}
