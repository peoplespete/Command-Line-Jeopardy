require 'japi'

module ClueFinder

  def self.get_clues
    # This gets clues of the exact points that the first round of the game would have. I could have built it and sorted them by value but wanted it to be more realistic.
    [100, 200, 300, 400, 500].map do |point_value|
      JAPI::Trebek.clues(clue_options.merge(value: point_value)).sample
    end
  end

private
  def self.clue_options
    {
      category: 25, # go to http://www.jservice.io/search if you want the ID of something that isn't 'science'
      min_date: DateTime.new(1996,1,1),
      max_date: DateTime.new(1997,1,1),
    }
  end

end
