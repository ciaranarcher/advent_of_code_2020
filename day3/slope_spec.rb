require_relative 'slope'

context Slope do
  describe '#new' do
    let(:input) { File.read('input.txt') }
    it 'creates an array' do
      s = Slope.new(input)
      expect(s.slope.length).to eq(323)
    end
  end

  describe '#at' do
    let(:input) { File.read('input.txt') }
    let(:s) { Slope.new(input) }

    describe('within range lookup') do
      it 'says :tree when there is a tree' do
        expect(s.at(1, 4)).to eq :tree
      end

      it 'says :snow when there is no tree' do
        expect(s.at(2, 3)).to eq :snow
      end
    end
  end
end
