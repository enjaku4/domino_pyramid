describe Game::Pyramid do
  let(:pyramid) { described_class.clone }
  let(:row) { double }

  describe '.clear!' do
    before { pyramid << row }

    it 'clears pyramid' do
      expect { pyramid.clear! }.to change { pyramid.rows }.from([row]).to([])
    end
  end

  describe '.<<' do
    before { pyramid.clear! }

    it 'adds a new bone to the row' do
      expect { pyramid << row }.to change { pyramid.rows }.from([]).to([row])
    end
  end
end
