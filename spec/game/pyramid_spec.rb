describe Game::Pyramid do
  let(:pyramid) { described_class.clone }
  let(:row) { double }

  describe '.<<' do
    it 'adds a new bone to the row' do
      expect { pyramid << row }.to change { pyramid.rows }.from([]).to([row])
    end
  end

  describe '.clear!' do
    before do
      pyramid.rows.clear
      pyramid << row
    end

    it 'clears pyramid' do
      expect { pyramid.clear! }.to change { pyramid.rows }.from([row]).to([])
    end
  end
end
