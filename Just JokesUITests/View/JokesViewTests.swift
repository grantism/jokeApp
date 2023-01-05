import XCTest
import Quick
import Nimble

class JokesViewTests: QuickSpec {
    var app: XCUIApplication!

    override func spec() {
        // Reset the app state before each test. Don't do this if test cases rely on results of previous tests (avoid writing test cases this way).
        beforeEach {
            DispatchQueue.main.sync {
                self.app = XCUIApplication()
                self.app.launch()
            }
        }

        // Basic UI test to ensure elements exist.
        // TODO: test ALL elements and their interactions.
        describe("Just Jokes") {
                context("when launched") {
                    it("should display all UI elements") {
                        let button = self.app.buttons.staticTexts["Another joke..."]
                        expect(button.exists).to(equal(true))
                    }
            }
        }
    }
}
