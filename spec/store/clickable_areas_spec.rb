describe Store::ClickableAreas do
  let(:clickable_areas) { described_class.clone }
  let(:clickable_area) { double }

  after { clickable_areas.clear! }

  describe '.<<' do
    it 'adds a new clickable area to the colection' do
      expect(clickable_areas << clickable_area).to match_array([clickable_area])
    end
  end

  describe '.find_clicked' do
    subject { clickable_areas.find_clicked(15, 46) }

    context 'if there is no clicked area in the collection' do
      before do
        allow(clickable_area).to receive(:contains?).with(15, 46).and_return(false)

        clickable_areas << clickable_area
      end

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

    context 'if there is a clicked area in the collection' do
      before do
        allow(clickable_area).to receive(:contains?).with(15, 46).and_return(true)

        clickable_areas << clickable_area
      end

      it 'returns it' do
        expect(subject).to eq(clickable_area)
      end
    end
  end

  describe '.clear!' do
    before { clickable_areas << clickable_area }

    it 'clears clickable areas' do
      expect { clickable_areas.clear! }.to change { clickable_areas.collection }.from([clickable_area]).to([])
    end
  end
end
