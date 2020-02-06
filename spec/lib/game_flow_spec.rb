
RSpec.describe GameFlow do
  context 'get_clues' do
    let(:correct_values) { [100, 200, 300, 400, 500] }

    it 'returns clues with appropriate values' do
      clue_values = ClueFinder.get_clues.map(&:value)
      expect(clue_values).to eq(correct_values)
    end

    context 'appropriately queries' do
      let(:clues) { [] }
      before do
        allow(JAPI::Trebek).to receive(:clues).and_return(clues)
      end

      it 'returns a random clue' do
        expect(clues).to receive(:sample).at_least(:once)

        ClueFinder.get_clues
      end

      it 'queries Trebek with a point value' do
        expect(JAPI::Trebek).to receive(:clues).with(hash_including(value: correct_values[0]))

        ClueFinder.get_clues
      end

      it 'queries Trebek with a appropriate clue options' do
        expect(JAPI::Trebek).to receive(:clues).with(hash_including(category: 25, min_date: DateTime.new(1996,1,1), max_date: DateTime.new(1997,1,1)))

        ClueFinder.get_clues
      end
    end
  end
end
