describe Game::PyramidBuilder do
  describe '.run' do
    subject { described_class.run }

    let(:pyramid) { Game::Pyramid }

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
        expect(row.bones.count).to eq(row.number + 1)
      end
    end

    it 'reveals the bones in the first and the last row' do
      subject

      expect((pyramid.rows.first.bones + pyramid.rows.last.bones).map { |bone| bone.revealed? }.uniq).to eq([true])
    end

    it 'does not reveal any other bones' do
      subject

      expect(pyramid.rows[1..5].flat_map { |row| row.bones.map { |bone| bone.revealed? } }.uniq ).to eq([false])
    end

    it 'builds a pyramid with all the bones from the domino set' do
      subject

      domino_values = described_class::DOMINO_VALUES
      pyramid.rows.each { |row| domino_values -= row.bones.map { |bone| [bone.first_value, bone.second_value] } }

      expect(domino_values).not_to be_empty
    end
  end
end
