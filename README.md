# JustJokes


## What does it do?
This app connects to the `Joke.one` API & retrieves the joke of the day (It SHOULD get a random joke, but I'm too cheap to spend the $10 for a license).
If the user want's to load more jokes, they can press the button located at the bottom of the page & it will load another joke from the API (this will just be the joke of the day again).

All jokes are displayed as pages in a scrollView.

## What could be improved?
Everything...
To start with, I would spend more time (and $10) to improve the UI to automatically load the next joke when the user reached the last page. I'd also make the cards look a bit nicer.

Next, I would increase test coverage everywhere. I implemented a couple of simeple tests, but if I had more time the service, view, view model, model would be covered.

Additionally, I would improve how dpeendancy injection is handled to make test mocking & substitution easier as well as follow through on the TODO comments in the code.

