describe Graphics::MessageDrawer do
  before { Store::Settings.set(window_width: 350.0, window_height: 700.0) }

  describe '.run' do
    it 'draws the message, its backdrop and the buttons' do
      described_class.run(:won)

      expect(described_class.send(:objects).size).to eq(4)
    end

    it 'removes the previously drawn objects' do
      described_class.run(:won)

      described_class.send(:objects).each { |object| expect(object).to receive(:remove) }

      described_class.run(:lost)
    end

    it 'raises an error if there is no such status' do
      expect { described_class.run(:foo) }.to raise_error(described_class::UnknownStatusError, "unknown game status \'foo\'")
    end
  end
end
