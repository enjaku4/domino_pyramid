describe Store::ClickableAreas do
  let(:clickable_areas) { described_class.clone }
  let(:clickable_area) { Graphics::ClickableArea.new(Game::Bone.new(2, 5), 45, 78) }

  before do
    Store::Settings.set(window_width: 350.0, window_height: 700.0)

    clickable_areas.clear!
  end

  describe '.<<' do
    it 'adds a new clickable area to the colection' do
      expect { clickable_areas << clickable_area }.to change { clickable_areas.collection }.from([]).to([clickable_area])
    end
  end

  describe '.find_clicked' do
    subject { clickable_areas.find_clicked(15, 46) }

    before { clickable_areas << clickable_area }

    context 'if there is no clicked area in the collection' do
      before { allow(clickable_area).to receive(:contains?).with(15, 46).and_return(false) }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

    context 'if there is a clicked area in the collection' do
      before { allow(clickable_area).to receive(:contains?).with(15, 46).and_return(true) }

      it 'returns it' do
        expect(subject).to eq(clickable_area)
      end
    end
  end

  describe '.clear!' do
    before { clickable_areas << clickable_area }

    it 'clears clickable areas' do
      expect { clickable_areas.clear! }.to change { clickable_areas.collection.any? }.from(true).to(false)
    end
  end
end
