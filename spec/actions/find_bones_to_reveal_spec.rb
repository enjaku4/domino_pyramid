describe Actions::FindBonesToReveal do
  describe '.run' do
    subject { Actions::FindBonesToReveal.run }

    (1..6).each { |number| let(:"bone_#{number}") { Game::Bone.new(0, number) } }

    before do
      Game::Pyramid.clear!

      row_1 = Game::Row.new(0)
      row_1 << bone_1
      bone_1.reveal!

      row_2 = Game::Row.new(1)
      row_2 << bone_2
      row_2 << bone_3

      row_3 = Game::Row.new(2)
      row_3 << bone_4
      row_3 << bone_5
      row_3 << bone_6
      row_3.bones.each(&:reveal!)

      Game::Pyramid << row_1
      Game::Pyramid << row_2
      Game::Pyramid << row_3
    end

    context 'if all bones are blocked' do
      it 'returns an empty array' do
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
      before do
        bone_5.delete!
        bone_6.delete!
      end

      it 'returns the unlocked bones' do
        expect(subject).to match([bone_3])
      end
    end
  end
end
