//
// Service for getting the jokes from the API.
//
// This helps make it easier to replace with a different API.
// We just create a new service that conforms to this structure.
//
//  Created by Grant McNally on 29/12/2022.
//

import Foundation
import Moya

class JokesService {
    private let provider: MoyaProvider<JokesApi>

    // Mockable for testing
    init(provider: MoyaProvider<JokesApi>) {
        self.provider = provider
    }

    convenience init() {
        self.init(provider: JokesApi.provider)
    }

    // Completion handler is escaping due to async API call
    func jokeOfTheDay(completion: @escaping (Joke?) -> Void) {
        provider.request(.jokeOfTheDay) { result in
            switch result {
            case .success(let response):
                do {
                    // Try to map the response body to our Jokes model & get the first joke.
                    let joke = try response.map(JokesResponse.self).contents.jokes.first?.joke
                    // Callbacks are quick & swifty.
                    // There are other approaches like observable, Reactive, change notifier, etc.
                    completion(joke)
                    return
                } catch {
                    // TODO: implement proper error reporting
                    print(error)
                }
            case .failure(let error):
                // TODO: implement proper error reporting
                print(error)
            }
            completion(nil)
        }
    }

}
