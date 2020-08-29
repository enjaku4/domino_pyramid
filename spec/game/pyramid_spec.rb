describe Game::Pyramid do
  let(:pyramid) { described_class.clone }
  let(:bone_1) { Game::Bone.new(2, 5) }
  let(:bone_2) { Game::Bone.new(5, 0) }
  let(:bone_3) { Game::Bone.new(6, 1) }
  let(:row_1) { Game::Row.new(1) }
  let(:row_2) { Game::Row.new(4) }
  let(:row_3) { Game::Row.new(6) }

  after { pyramid.clear! }

  describe '.clear!' do
    before { pyramid << row_1 }

    it 'clears pyramid' do
      expect { pyramid.clear! }.to change { pyramid.rows }.from([row_1]).to([])
    end
  end

  describe '.<<' do
    it 'adds a new bone to the row' do
      expect { pyramid << row_1 }.to change { pyramid.rows }.from([]).to([row_1])
    end
  end

  describe '.row_with_bone' do
    before do
      row_1 << bone_1
      row_2 << bone_2

      pyramid << row_1
      pyramid << row_2
    end

    context 'if passed bone exists' do
      it 'returns its row' do
        expect(pyramid.row_with_bone(bone_2)).to eq(row_2)
      end
    end

    context 'if passed bone does not exist' do
      it 'returns nil' do
        expect(pyramid.row_with_bone(bone_3)).to be_nil
      end
    end
  end

  describe '.selected_bones' do
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

  describe '.not_revealed_bones' do
    before do
      bone_1.reveal!

      row_1 << bone_1
      row_2 << bone_2
      row_3 << bone_3

      pyramid << row_1
      pyramid << row_2
      pyramid << row_3
    end

    it 'returns not revealed bones' do
      expect(pyramid.not_revealed_bones).to match([bone_2, bone_3])
    end
  end
end
