require_relative 'lib/clue_finder'
require 'highline'

clues = ClueFinder.get_clues
clues.each do |clue|
  puts "For $#{clue.value}, #{clue.question}."
end
