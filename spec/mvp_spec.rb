require 'pry'
require 'stringio'

def capture_stdout(&blk)
  # found this on stack overflow to help capture the output from the command line
  old = $stdout
  $stdout = fake = StringIO.new
  blk.call
  fake.string
ensure
  $stdout = old
end

RSpec.describe 'MVP' do
  context 'displays' do
    before do
      clues = [
        instance_double('clue', value: 100, question: 'Asia' ),
        instance_double('clue', value: 200, question: 'Antarctica' ),
      ]
      allow(ClueFinder).to receive(:get_clues).and_return(clues)
    end

    it 'appropriate value and question for first clue' do
      printed = capture_stdout do
        require_relative '../mvp.rb'
      end

      expect(printed).to include('100, Asia')
      expect(printed).to include('200, Antarctica')
    end
  end
end
