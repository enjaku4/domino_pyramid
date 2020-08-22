describe Store::Settings do
  subject { described_class.clone }

  before { subject.set(window_width: 350.0, window_height: 700.0) }

  it 'sets bone width' do
    expect(subject.bone_width).to eq(50)
  end

  it 'sets bone height' do
    expect(subject.bone_height).to eq(100)
  end

  it 'sets separator size' do
    expect(subject.separator_size).to eq(2.9411764705882355)
  end

  it 'sets vertical border width' do
    expect(subject.vertical_border_width).to eq(2)
  end

  it 'sets horizontal border width' do
    expect(subject.horizontal_border_width).to eq(2)
  end

  it 'sets spot radius' do
    expect(subject.spot_radius).to eq(4)
  end

  it 'raise an error if there is no such setting' do
    expect { subject.foo }.to raise_error(KeyError)
  end
end
