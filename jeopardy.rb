require_relative 'lib/clue_finder'

require 'highline'
require 'pry'


def question_selection(cli, clues)
  cli.choose do |menu|
    menu.prompt = "Let's Play! Choose a clue."
    clues.each do |clue|
      menu.choice(clue.value) { clue }
    end
  end
end

points = 0
cli = HighLine.new
clues = ClueFinder.get_clues

puts "Welcome to Command Line Jeopardy!"
puts "We're going to be working within the Science category."

5.times do
  puts "You've got #{points} points."

  clue = question_selection(cli, clues)
  clues.delete(clue)

  # puts clue.answer # This makes it easy to use the game if you are trying to check that it works

  answer = cli.ask clue.question
  if answer.downcase == clue.answer.downcase
    points += clue.value
    puts "Super!"
  else
    points -= clue.value
    puts "Sorry, you missed that one...Chin up, sport! Try again."
  end
end

puts "Thanks for playing! You have #{points} points. Don't spend it all in one place :)"
