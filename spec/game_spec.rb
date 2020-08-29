describe Game do
  describe '.start' do
    it 'builds a new pyramid and then draws it' do
      expect(Game::PyramidBuilder).to receive(:run).ordered
      expect(Graphics::PyramidDrawer).to receive(:run).ordered
      Game.start
    end
  end

  describe '.restart' do
    it 'clears the pyramid, builds a new one and refreshes the game' do
      expect(Game::Pyramid).to receive(:clear!).ordered
      expect(Game::PyramidBuilder).to receive(:run).ordered
      expect(described_class).to receive(:refresh).ordered
      Game.restart
    end
  end

  describe '.refresh' do
    it 'clears the ClickableAreas store and Window, then redrawes the pyramid' do
      expect(Store::ClickableAreas).to receive(:clear!).ordered
      expect(Window).to receive(:clear).ordered
      expect(Graphics::PyramidDrawer).to receive(:run).ordered
      Game.refresh
    end
  end
end
