describe Game do
  before { Store::Settings.set(window_width: 100, window_height: 250) }

  describe '.start' do
    it 'builds a new pyramid and its view, then refreshes the game' do
      expect(Game::Pyramid).to receive(:clear!).ordered
      expect(Game::PyramidBuilder).to receive(:run).ordered
      expect(Graphics::PyramidView).to receive(:build).ordered
      expect(Game).to receive(:refresh).ordered
      Game.start
    end
  end

  describe '.refresh' do
    it 'refreshes the pyramid view, checks if the game is finished and requests a render' do
      expect(Graphics::PyramidView).to receive(:refresh).ordered
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
