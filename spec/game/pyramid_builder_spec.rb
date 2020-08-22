describe Game::PyramidBuilder do
  describe '.run' do
    subject { described_class.run }

    let(:pyramid) { Game::Pyramid}

    around do |example|
      pyramid.clear!
      example.run
      pyramid.clear!
    end

    it 'builds a pyramid with 7 rows' do
      subject

      expect(pyramid.rows.count).to eq(7)
    end

    it 'builds a pyramid with the right number of bones in each row' do
      subject

      pyramid.rows.each do |row|
        expect(row.bones.count).to eq(row.number)
      end
    end

    it 'builds a pyramid with all the bones from the dominoes set' do
      subject

      dominoes = described_class::DOMINOES
      pyramid.rows.each { |row| dominoes -= row.bones }

      expect(dominoes).to be_empty
    end
  end
end
