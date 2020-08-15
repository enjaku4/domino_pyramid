require_relative '../../../lib/game/pyramid_builder'

describe Game::PyramidBuilder do
  describe '.run' do
    subject { described_class.run }

    it 'returns a Game::Pyramid class object' do
      expect(subject).to be_a(Game::Pyramid)
    end

    it 'returns a pyramid with 7 rows' do
      expect(subject.rows.count).to eq(7)
    end

    it 'returns a pyramid with the right number of bones in each row' do
      subject.rows.each do |row|
        expect(row.bones.count).to eq(row.number)
      end
    end

    it 'returns a pyramid with all the bones from the dominoes set' do
      dominoes = described_class::DOMINOES
      subject.rows.each { |row| dominoes -= row.bones }

      expect(dominoes).to be_empty
    end
  end
end
