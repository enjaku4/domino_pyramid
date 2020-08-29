describe Actions::FindBonesToReveal do
  subject { Actions::FindBonesToReveal.run }

  let(:bone_1) { Game::Bone.new(0, 5) }
  let(:bone_2) { Game::Bone.new(0, 4) }
  let(:bone_3) { Game::Bone.new(1, 6) }
  let(:bone_4) { Game::Bone.new(2, 5) }
  let(:bone_5) { Game::Bone.new(5, 3) }
  let(:bone_6) { Game::Bone.new(4, 1) }
  let(:bone_7) { Game::Bone.new(6, 2) }

  let(:row_1) { Game::Row.new(0) }
  let(:row_2) { Game::Row.new(1) }
  let(:row_3) { Game::Row.new(2) }

  let(:pyramid) { Game::Pyramid }

  before do
    pyramid.clear!

    row_1 << bone_1

    row_2 << bone_2
    row_2 << bone_3

    row_3 << bone_5
    row_3 << bone_6
    row_3 << bone_7

    pyramid << row_1
    pyramid << row_2
    pyramid << row_3

    bone_1.reveal!
    bone_5.reveal!
    bone_6.reveal!
    bone_7.reveal!
  end

  context 'if all bones are blocked' do
    it 'returns nil' do
      expect(subject).to eq([])
    end
  end

  context 'if bones are unlocked from the higher row' do
    before { bone_1.delete! }

    it 'returns the unlocked bones' do
      expect(subject).to match([bone_2, bone_3])
    end
  end

  context 'if bones are unlocked from the lower row' do
    before { bone_7.delete!; bone_6.delete! }

    it 'returns the unlocked bones' do
      expect(subject).to match([bone_3])
    end
  end
end
