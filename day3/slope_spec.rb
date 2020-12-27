require_relative 'slope'

context Slope do
  describe '#new' do
    let(:input) { File.read('input.txt') }
    it 'creates an array' do
      s = Slope.new(input)
      expect(s.slope.length).to eq(323)
    end
  end
end
