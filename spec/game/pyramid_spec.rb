describe Game::Pyramid do
  let(:pyramid) { described_class }
  let(:row) { Game::Row.new(4) }

  before { pyramid.clear! }

  describe '#<<' do
    it 'adds a new bone to the row' do
      expect { pyramid << row }.to change { pyramid.rows }.from([]).to([row])
    end
  end

  describe 'clear!' do
    before { pyramid << row }

    it 'clears pyramid' do
      expect { pyramid.clear! }.to change { pyramid.rows }.from([row]).to([])
    end
  end
end
