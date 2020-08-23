describe Game::Bone do
  let(:bone) { described_class.new(0, 3) }

  describe '#rank' do
    it "returns the bone\'s rank" do
      expect(bone.rank).to eq(3)
    end
  end

  describe '#reveal!' do
    it 'reveals the bone' do
      expect { bone.reveal! }.to change { bone.revealed? }.from(false).to(true)
    end
  end

  describe '#toggle_selection!' do
    subject { bone.toggle_selection! }

    context 'if the bone is not selected' do
      it 'becomes selected' do
        expect { subject }.to change { bone.selected? }.from(false).to(true)
      end
    end

    context 'if the bone is selected' do
      before { bone.toggle_selection! }

      it 'becomes not selected' do
        expect { subject }.to change { bone.selected? }.from(true).to(false)
      end
    end
  end
end
