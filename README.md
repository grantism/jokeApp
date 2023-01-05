# JustJokes


## What does it do?
This app connects to the `Joke.one` API & retrieves the joke of the day (It SHOULD get a random joke, but I'm too cheap to spend the $10 for a license).
If the user want's to load more jokes, they can press the button located at the bottom of the page & it will load another joke from the API (this will just be the joke of the day again).

All jokes are displayed as pages in a scrollView.

## What could be improved?
Everything...

To start with, I would spend more time (and $10) to improve the UI to automatically load the next joke when the user reached the last page. I'd also make the cards look a bit nicer as well as implement proper loading & error states. I'd also like to improve the UI to use proper constraints to ensure it works across more devices and orientations.

Adding in some local caching of the jokes to persist them across sessions qould also improve the users experience.

Next, I would increase test coverage everywhere. I implemented a couple of simeple tests, but if I had more time the service, view, view model, model would be covered as well as more UI tests & integration tests.
Additionally I would write test cases in a more BDD style (given when then)

Additionally, I would improve how dependancy injection is handled to make test mocking & substitution easier as well as follow through on the TODO comments in the code.


