import XCTest
import Moya
import Quick
import Nimble

@testable import Just_Jokes

class JokesViewModelTests: QuickSpec {
    let provider = MoyaProvider<JokesApi>(
        stubClosure: MoyaProvider.immediatelyStub
    )
    var service: JokesService!
    var jokesViewModel: JokesViewModel!

    override func spec() {
        beforeEach {
            self.service = JokesServiceMock(provider: self.provider)
            self.jokesViewModel = JokesViewModel(service: self.service)
        }

        describe("\(JokesViewModel.self)") {
            describe("fetchData()") {
                context("when invoked") {
                    it("should return a joke") {
                        let expected = "Text"
                        self.service.jokeOfTheDay { joke in
                            expect(joke?.text).to(equal(expected))
                        }
                    }
                }
            }
        }
    }
}
