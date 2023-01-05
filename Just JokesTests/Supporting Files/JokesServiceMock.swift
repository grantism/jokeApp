import Foundation
import Moya

@testable import Just_Jokes

// Mock service for testing. Could use a package to do this instead.
class JokesServiceMock: JokesService {
    var provider: Moya.MoyaProvider<JokesApi>

    init(provider: MoyaProvider<JokesApi>) {
        self.provider = provider
    }

    func jokeOfTheDay(completion: @escaping (Joke?) -> Void) {
        // TODO: use a generator & builder to randomise this content and improve how it is tested.
        completion(Joke(title: "Title", text: "Text"))
    }
}
