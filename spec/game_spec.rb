describe Game do
  before { Store::Settings.set(window_width: 100, window_height: 250) }

  describe '.start' do
    it 'builds a new pyramid and then refreshes the game' do
      expect(Game::Pyramid).to receive(:clear!).ordered
      expect(Game::PyramidBuilder).to receive(:run).ordered
      expect(Game).to receive(:refresh).ordered
      Game.start
    end
  end

  describe '.refresh' do
    it 'clears the Window, then redrawes the pyramid, checks if the game is finished and requests a render' do
      expect(Window).to receive(:clear).ordered
      expect(Graphics::PyramidDrawer).to receive(:run).ordered
      expect(Actions::CheckIfGameFinished).to receive(:run).ordered
      expect(Window.current).to receive(:request_render).ordered
      Game.refresh
    end
  end

  describe '.finish' do
    it 'draws the game status' do
      expect(Graphics::MessageDrawer).to receive(:run).with(:foo)
      Game.finish(:foo)
    end
  end
end
