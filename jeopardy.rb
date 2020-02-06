require_relative 'lib/clue_finder'

require 'pry'

clues = ClueFinder.get_clues

clues.each do |clue|
  puts clue.value
  puts clue.category.title
  puts clue.question
  puts clue.answer
  puts "======="
end

