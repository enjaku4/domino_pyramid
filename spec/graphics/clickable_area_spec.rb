describe Graphics::ClickableArea do
  subject { described_class.new(Game::Bone.new(4, 5), 27, 35) }

  before { Store::ClickableAreas.clear! }

  it 'is inherits from Window::Rectangle class' do
    expect(subject).to be_a(Window::Rectangle)
  end

  describe '#store' do
    it 'stores the clickable area' do
      expect { subject.store }.to change { Store::ClickableAreas.collection }.from([]).to([subject])
    end
  end
end
