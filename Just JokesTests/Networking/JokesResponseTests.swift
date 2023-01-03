import XCTest
@testable import Just_Jokes

final class JokesResponseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJokeModel() throws {
        // TODO: create builders to properly create test data
        let title = "title"
        let text = "text"

        let model = Joke(title: title, text: text)
        XCTAssertEqual(model.title, title, "title must be \(title)")
        XCTAssertEqual(model.text, text, "text must be \(text)")
    }

    // TODO: test the rest of the models
}
