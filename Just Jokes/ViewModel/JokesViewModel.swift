//
//  ViewModel
//
//  Created by Grant McNally on 2/1/2023.
//
import Foundation

class JokesViewModel {
    var jokes =  [Joke]()
    let jokesService: JokesService

    // TODO: improve how DI is handled
    convenience init() {
        self.init(service: JokesService())
    }

    init(service: JokesService) {
        jokesService = service
    }

    func fetchData(completion: @escaping () -> Void) {
        // TODO: replace this with the "random joke" endpoint. (I didn't want to spend $10 for the API).
        jokesService.jokeOfTheDay { joke in
            if joke != nil {
                self.jokes.append(joke!)
            }
            completion()
        }
    }

    func configure (_ view: JokesView) {
        // TODO: add some nice loading & error states
        view.addPages()
    }
}
