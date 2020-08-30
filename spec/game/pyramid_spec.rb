describe Game::Pyramid do
  let(:pyramid) { described_class.clone }

  after { pyramid.clear! }

  describe '.clear!' do
    before { pyramid << Game::Row.new(4) }

    it 'clears pyramid' do
      expect { pyramid.clear! }.to change { pyramid.rows.any? }.from(true).to(false)
    end
  end

  describe '.<<' do
    let(:row) { Game::Row.new(3) }

    it 'adds a new row to the pyramid' do
      expect { pyramid << row }.to change { pyramid.rows }.from([]).to([row])
    end
  end

  describe '.row_with_bone' do
    let(:row) { Game::Row.new(3) }
    let(:bone) { Game::Bone.new(4, 6) }

    before do
      row << bone

      another_row = Game::Row.new(4)
      another_row << Game::Bone.new(0, 5)

      pyramid << row
      pyramid << another_row
    end

    context 'if passed bone is in pyramid' do
      it 'returns its row' do
        expect(pyramid.row_with_bone(bone)).to eq(row)
      end
    end

    context 'if passed bone is not in pyramid' do
      it 'returns nil' do
        expect(pyramid.row_with_bone(Game::Bone.new(4, 1))).to be_nil
      end
    end
  end

  describe '.selected_bones' do
    let(:bone_1) { Game::Bone.new(1, 5) }
    let(:bone_2) { Game::Bone.new(2, 5) }

    before do
      bone_1.toggle_selection!
      bone_2.toggle_selection!

      row_1 = Game::Row.new(1)
      row_1 << bone_1

      row_2 = Game::Row.new(2)
      row_2 << bone_2

      row_3 = Game::Row.new(3)
      row_3 << Game::Bone.new(5, 0)

      pyramid << row_1
      pyramid << row_2
      pyramid << row_3
    end

    it 'returns selected bones' do
      expect(pyramid.selected_bones).to match([bone_1, bone_2])
    end
  end

  describe '.revealed_bones' do
    let(:bone_1) { Game::Bone.new(1, 5) }

    before do
      row_1 = Game::Row.new(1)
      row_1 << bone_1

      bone_1.reveal!

      bone_2 = Game::Bone.new(3, 2)

      row_2 = Game::Row.new(2)
      row_2 << bone_2

      bone_2.reveal!
      bone_2.delete!

      bone_3 = Game::Bone.new(5, 0)

      row_3 = Game::Row.new(3)
      row_3 << bone_3

      pyramid << row_1
      pyramid << row_2
      pyramid << row_3
    end

    it 'returns revealed but not deleted bones' do
      expect(pyramid.revealed_bones).to match([bone_1])
    end
  end

  describe '.not_revealed_bones' do
    let(:bone_1) { Game::Bone.new(1, 5) }
    let(:bone_2) { Game::Bone.new(2, 5) }

    before do
      row_1 = Game::Row.new(1)
      row_1 << bone_1

      row_2 = Game::Row.new(2)
      row_2 << bone_2

      bone_3 = Game::Bone.new(5, 0)

      row_3 = Game::Row.new(3)
      row_3 << bone_3

      bone_3.reveal!

      pyramid << row_1
      pyramid << row_2
      pyramid << row_3
    end

    it 'returns not revealed bones' do
      expect(pyramid.not_revealed_bones).to match([bone_1, bone_2])
    end
  end

  describe '.bones' do
    let(:bone_1) { Game::Bone.new(1, 5) }
    let(:bone_2) { Game::Bone.new(2, 5) }

    before do
      row_1 = Game::Row.new(1)
      row_1 << bone_1

      row_2 = Game::Row.new(2)
      row_2 << bone_2

      pyramid << row_1
      pyramid << row_2
    end

    it 'returns all the bones in pyramid' do
      expect(pyramid.bones).to match([bone_1, bone_2])
    end
  end
end
