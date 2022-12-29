//
// Models for mapping the API response to the app.
// TODO: use different models for data sources & views
// TODO: (external data sources shouldn't dictate internal data structure & can change).
//
//  Created by Grant McNally on 29/12/2022.
//
import Foundation

struct JokesResponse: Codable {
  let contents: JokesContents
}

struct JokesContents: Codable {
    let jokes: [Jokes]
}

struct Jokes: Codable {
    let description: String
    let joke: Joke
}

struct Joke: Codable {
    let title: String
    let text: String
}
