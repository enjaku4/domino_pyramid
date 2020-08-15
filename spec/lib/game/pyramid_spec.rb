require_relative '../../../lib/game/pyramid'

describe Game::Pyramid do
  describe '#<<' do
    let(:pyramid) { described_class.new }
    let(:row) { Game::Row.new(4) }

    it 'adds a new bone to the row' do
      expect { pyramid << row }.to change { pyramid.rows }.from([]).to([row])
    end
  end
end
