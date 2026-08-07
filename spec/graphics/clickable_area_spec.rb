describe Graphics::ClickableArea do
  subject { described_class.new(Game::Bone.new(4, 5), 27, 35) }

  before { Store::Settings.set(window_width: 300, window_height: 600) }

  it 'is inherits from Window::Rectangle class' do
    expect(subject).to be_a(Window::Rectangle)
  end

  it 'exposes the bone' do
    expect(subject.bone.rank).to eq(9)
  end
end
