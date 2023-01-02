//
//  ViewModel for updating the data shown in the view
//
//  Created by Grant McNally on 2/1/2023.
//
//
import Foundation

protocol JokesViewModelType {
    func fetchData(completion: @escaping (Joke?) -> Void)
    func configure (_ view: JokesView)
}

class JokesViewModel: JokesViewModelType {
    var jokes: Joke?
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
            self.jokes = joke
            // TODO: can probably remove joke from completion handler.
            completion(self.jokes)
        }
    }

    func configure (_ view: JokesView) {
        // if no joke, show loading?
        view.jokeLabel.text = jokes?.text ?? "none yet"
    }
}
