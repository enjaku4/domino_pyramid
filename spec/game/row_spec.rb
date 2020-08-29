describe Game::Row do
  let(:row) { described_class.new(3) }
  let(:bone) { Game::Bone.new(0, 4) }

  describe '#<<' do
    it 'adds a new bone to the row' do
      expect { row << bone }.to change { row.bones }.from([]).to([bone])
    end
  end

  describe '#has_bone?' do
    before { row << bone }

    context 'if there is such a bone in the row' do
      it 'returns true' do
        expect(row.has_bone?(bone)).to be true
      end
    end

    context 'if there is no such bone in the row' do
      it 'returns false' do
        expect(row.has_bone?(Game::Bone.new(0, 3))).to be false
      end
    end
  end

  describe '#bone_position' do
    before { row << bone }

    context 'if there is such a bone in the row' do
      it 'returns its position' do
        expect(row.bone_position(bone)).to eq(0)
      end
    end

    context 'if there is no such bone in the row' do
      it 'returns nil' do
        expect(row.bone_position(Game::Bone.new(1, 1))).to be_nil
      end
    end
  end

  describe '#bones_at' do
    let(:another_bone) { Game::Bone.new(2, 3) }

    before do
      row << bone
      row << another_bone
    end

    context 'if bones on passed positions exist' do
      context 'if one position passed as an argument' do
        it 'returns an array with the bone at this position' do
          expect(row.bones_at(1)).to eq([another_bone])
        end
      end

      context 'if multiple positions passed as arguments' do
        it 'returns an array with bones at this positions' do
          expect(row.bones_at(0, 1)).to eq([bone, another_bone])
        end
      end
    end

    context 'if positions is lower than possible' do
      it 'returns nil instead of a bone' do
        expect(row.bones_at(-1, 0)).to eq([nil, bone])
      end
    end

    context 'if positions is higher than possible' do
      it 'returns nil instead of a bone' do
        expect(row.bones_at(1, 2)).to eq([another_bone, nil])
      end
    end
  end
end
