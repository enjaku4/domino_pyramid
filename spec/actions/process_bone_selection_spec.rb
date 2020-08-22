describe Actions::ProcessBoneSelection do
  describe '.run' do
    subject { described_class.run(double(x: 3, y: 55)) }

    let(:event) { double }

    context 'if it is a clickable area' do
      let(:bone) { Game::Bone.new(2, 3) }

      before { allow(Store::ClickableAreas).to receive(:find_clicked).with(3, 55).and_return(double(bone: bone, x: 13, y: 65)) }

      it 'toggles bone selection' do
        expect { subject }.to change { bone.selected? }.from(false).to(true)
      end
    end

    context 'if it is not a clickable area' do
      before { allow(Store::ClickableAreas).to receive(:find_clicked).with(3, 55).and_return(nil) }

      it 'doen not toggle any bones selection' do
        expect_any_instance_of(Game::Bone).not_to receive(:toggle_selection!)
      end
    end
  end
end
