describe Actions::CheckIfGameFinished do
  describe '.run' do
    subject { described_class.run }

    let(:pyramid) { Game::Pyramid.clone }
    let(:bone_1) { Game::Bone.new(4, 1) }

    before do
      bone_1.reveal!
      bone_2.reveal!

      row_1 = Game::Row.new(4)
      row_1 << bone_1

      row_2 = Game::Row.new(5)
      row_2 << bone_2

      pyramid << row_1
      pyramid << row_2
    end

    context 'if the game is won' do
      let(:bone_2) { Game::Bone.new(4, 4) }

      before do
        bone_1.delete!
        bone_2.delete!
      end

      it "finishes the game with the \'won\' status" do
        expect(Game).to receive(:finish).with(:won)
        subject
      end
    end

    context 'if the game is lost' do
      let(:bone_2) { Game::Bone.new(4, 4) }

      it "finishes the game with the \'lost\' status" do
        expect(Game).to receive(:finish).with(:lost)
        subject
      end
    end

    context 'if the game is neither won nor lost' do
      let(:bone_2) { Game::Bone.new(4, 3) }

      it 'does not finish the game' do
        expect(Game).not_to receive(:finish)
        subject
      end
    end
  end
end
