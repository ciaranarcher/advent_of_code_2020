require_relative 'approach'
require_relative 'slope'

context Approach do
  let(:input) { File.read('example.txt') }
  let(:s) { Slope.new(input) }

  it 'works with examples' do
    expect(Approach.new(s, 1, 1).process).to eq 2
    expect(Approach.new(s, 3, 1).process).to eq 7
    expect(Approach.new(s, 5, 1).process).to eq 3
    expect(Approach.new(s, 7, 1).process).to eq 4
    expect(Approach.new(s, 1, 2).process).to eq 2
  end
end
