require_relative 'clue_finder'

require 'highline'
require 'pry'

module GameFlow
  def self.run
    points = 0
    cli = HighLine.new
    clues = ClueFinder.get_clues

    introduction

    clues.size.times do
      say_points(points)

      clue = question_selection(cli, clues)
      clues.delete(clue)
      # puts clue.answer # This makes it easy to use the game if you are trying to check that it works

      answer = cli.ask clue.question
      points = evaluate_answer(clue, answer, points)
    end

    goodbye(points)
  end

  private

  def self.introduction
    puts "Welcome to Command Line Jeopardy!"
    puts "We're going to be working within the Science category."
  end

  def self.say_points(points)
    puts "You've got #{points} points."
  end

  def self.question_selection(cli, clues)
    cli.choose do |menu|
      menu.prompt = "Let's Play! Choose a clue."
      clues.each do |clue|
        menu.choice(clue.value) { clue }
      end
    end
  end

  def self.evaluate_answer(clue, answer, points)
    if answer.downcase == clue.answer.downcase
      points += clue.value
      puts "Super!"
    else
      points -= clue.value
      puts "Sorry, you missed that one...Chin up, sport! Try again."
    end
    points
  end

  def self.goodbye(points)
    puts "Thanks for playing! You have #{points} points. Don't spend it all in one place :)"
  end
end


