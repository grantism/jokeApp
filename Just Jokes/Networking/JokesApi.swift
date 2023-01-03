//
// API implementation for retrieving jokes.
//
//  Created by Grant McNally on 29/12/2022.
//

import Foundation
import Moya

private struct JokesApiDetails {
    // "Safely" assuming the hardcoded URL will never result in nil / null.
    static let baseUrl = URL(string: "https://api.jokes.one")!
    static let apiKey = ""
}

enum JokesApi {
    // This is just var to allow mocking of moya.
    static var provider = MoyaProvider<JokesApi>(
            plugins: [
                NetworkLoggerPlugin(
                    configuration: .init(logOptions: .verbose)
                )
            ]
        )

    // Declare the endpoints we want to call
    case jokeOfTheDay
}

// Provide implementation for each endpoint
extension JokesApi: TargetType {
    var baseURL: URL {
        JokesApiDetails.baseUrl
    }

    var path: String {
        switch self {
        case .jokeOfTheDay:
            return "/jod"
        }
    }

    var method: Moya.Method {
        switch self {
        case .jokeOfTheDay:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .jokeOfTheDay:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return [
            "Accept": "application/json",
            "Content-type": "application/json",
            "X-JokesOne-Api-Secret": JokesApiDetails.apiKey
        ]
    }

    // Mocking for tests
    var sampleData: Data {
        return """
 {
    \"success\": {
       \"total\":1
    },
    \"contents\":{
       \"jokes\":[
          {
             \"description\":\"Joke of the day \",
             \"language\":\"en\",
             \"background\":\"\",
             \"category\":\"jod\",
             \"date\":\"2022-12-29\",
             \"joke\":{
                \"title\":\"Tornado Cow\",
                \"lang\":\"en\",
                \"length\":\"96\",
                \"clean\":\"1\",
                \"racial\":\"0\",
                \"date\":\"2022-12-29\",
                \"id\":\"S_PLaypT0Xjxr34Q5qsdKweF\",
                \"text\":\"Q: Whatever happened to the cow that was lifted into the air by the tornado?\\r\\nA: Udder disaster!\"
             }
          }
       ],
       \"copyright\":\"2019-20 https:\\/\\/jokes.one\"
    }
 }
""".data(using: .utf8)!
    }

}
