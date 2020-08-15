require_relative '../../../lib/game/bone'

describe Game::Bone do
  let(:bone) { described_class.new(0, 3) }

  describe '#rank' do
    it "returns the bone\'s rank" do
      expect(bone.rank).to eq(3)
    end
  end

  describe '#reveal' do
    it 'reveals the bone' do
      expect { bone.reveal }.to change { bone.revealed? }.from(false).to(true)
    end
  end
end
