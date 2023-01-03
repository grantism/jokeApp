import XCTest
import Moya
import Quick
import Nimble

@testable import Just_Jokes

class JokeServiceTests: QuickSpec {
    let provider = MoyaProvider<JokesApi>(
        stubClosure: MoyaProvider.immediatelyStub
    )
    var service: JokesService!

    override func spec() {
        beforeEach {
            self.service = JokesService(provider: self.provider)
        }

        describe("\(JokesService.self)") {
            describe("jokeOfTheDay()") {
                context("when invoked") {
                    it("should return a joke") {
                        let expected = "Q: Whatever happened to the cow that was lifted into the air by the tornado?\r\nA: Udder disaster!"
                        self.service.jokeOfTheDay { joke in
                            expect(joke?.text).to(equal(expected))
                        }
                    }
                }
            }
        }
    }
}
