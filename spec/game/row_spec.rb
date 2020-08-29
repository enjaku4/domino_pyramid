describe Game::Row do
  let(:row) { described_class.new(3) }
  let(:bone_1) { Game::Bone.new(2, 3) }
  let(:bone_2) { Game::Bone.new(0, 4) }

  describe '#<<' do
    it 'adds a new bone to the row' do
      expect { row << bone_1 }.to change { row.bones }.from([]).to([bone_1])
    end
  end

  describe '#has_bone?' do
    before { row << bone_1 }

    context 'if there is such a bone in the row' do
      it 'returns true' do
        expect(row.has_bone?(bone_1)).to be true
      end
    end

    context 'if there is no such bone in the row' do
      it 'returns false' do
        expect(row.has_bone?(bone_2)).to be false
      end
    end
  end

  describe '#bone_position' do
    before { row << bone_1 }

    context 'if there is such a bone in the row' do
      it 'returns its position' do
        expect(row.bone_position(bone_1)).to eq(0)
      end
    end

    context 'if there is no such bone in the row' do
      it 'returns nil' do
        expect(row.bone_position(bone_2)).to be_nil
      end
    end
  end

  describe '#bones_at' do
    before do
      row << bone_1
      row << bone_2
    end

    context 'if bones on passed positions exist' do
      context 'if one position passed as an argument' do
        it 'returns an array with the bone at this position' do
          expect(row.bones_at(1)).to eq([bone_2])
        end
      end

      context 'if multiple positions passed as arguments' do
        it 'returns an array with bones at this positions' do
          expect(row.bones_at(0, 1)).to eq([bone_1, bone_2])
        end
      end
    end

    context 'if positions is lower than possible' do
      it 'returns nil instead of a bone' do
        expect(row.bones_at(-1, 0)).to eq([nil, bone_1])
      end
    end

    context 'if positions is higher than possible' do
      it 'returns nil instead of a bone' do
        expect(row.bones_at(1, 2)).to eq([bone_2, nil])
      end
    end
  end
end
