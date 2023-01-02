//
//  ViewModel for updating the data shown in the view
//
//  Created by Grant McNally on 2/1/2023.
//
import Foundation

class JokesViewModel {
    var jokes =  [Joke]()
    let jokesService: JokesService

    // TODO: improve DI
    convenience init() {
        self.init(service: JokesService())
    }

    init(service: JokesService) {
        jokesService = service
    }

    func fetchData(completion: @escaping (Joke?) -> Void) {
        jokesService.jokeOfTheDay { joke in
            if joke != nil {
                self.jokes.append(joke!)
            }
            // TODO: can probably remove joke from completion handler.
            completion(joke)
        }
    }

    func configure (_ view: JokesView) {
        // TODO: if no jokes, show loading?
        view.addPages()
    }
}
