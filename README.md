# Command-Line-Jeopardy
Command Line Jeopardy Using JService.io API
---

Before you do anything remember to:
```bash
bundle install
```

I ended up making some design decisions that may be controversial so here's a sense of why I built what I built.
First off, I made the choice to work this as a command line app.

I used a [gem to interact with the JService API](https://rubygems.org/gems/japi) mostly just because it was super straightforward to use. If I were to have to create it myself I would have used [HTTParty](https://rubygems.org/gems/httparty) to make the calls myself. The code that gets the clues is in found [lib/clue_finder.rb](lib/clue_finder.rb). One final note: I didn't sort because I thought it made much more sense to get clues for each of the values (I specified that via an option that gets sent with the API call) that a real Jeopardy game would have required instead of getting any old questions with points and sorting them.

[mvp.rb](mvp.rb) is a super simple file that prints out the clues that are collected by the ClueFinder module.
To run it in the terminal:
```bash
ruby mvp.rb
```

[overachiever.rb](overachiever.rb) contains the code that runs the game itself. I know this wasn't necessary but I couldn't stop myself.

To play the game in the terminal run:
```bash
ruby overachiever.rb
```

Of course I included tests for mvp.rb and clue_finder.rb (I would add tests for overachiever.rb if given a bit more time) in the spec folder.
To run the tests:
```bash
rspec
```

---
Above all thank you both so much for your time!
-Pete Dunlap
