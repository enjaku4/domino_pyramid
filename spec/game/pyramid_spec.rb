describe Game::Pyramid do
  let(:pyramid) { described_class.clone }
  let(:row) { double }

  before { pyramid.clear! }

  describe '.clear!' do
    before { pyramid << row }

    it 'clears pyramid' do
      expect { pyramid.clear! }.to change { pyramid.rows }.from([row]).to([])
    end
  end

  describe '.<<' do
    it 'adds a new bone to the row' do
      expect { pyramid << row }.to change { pyramid.rows }.from([]).to([row])
    end
  end

  describe '.selected_bones' do
    let(:bone_1) { Game::Bone.new(2, 5) }
    let(:bone_2) { Game::Bone.new(5, 0) }
    let(:bone_3) { Game::Bone.new(6, 1) }

    let(:row_1) { Game::Row.new(1) }
    let(:row_2) { Game::Row.new(4) }
    let(:row_3) { Game::Row.new(6) }

    before do
      bone_1.toggle_selection!
      bone_2.toggle_selection!

      row_1 << bone_1
      row_2 << bone_2
      row_3 << bone_3

      pyramid << row_1
      pyramid << row_2
      pyramid << row_3
    end

    it 'returns selected bones' do
      expect(pyramid.selected_bones).to match([bone_1, bone_2])
    end
  end
end
