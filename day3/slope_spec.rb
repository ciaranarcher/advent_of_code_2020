require_relative 'slope'

context Slope do
  describe '#new' do
    let(:input) { File.read('input.txt') }
    let(:s) { Slope.new(input) }

    it 'creates an array' do
      expect(s.slope.length).to eq(323)
    end

    it 'has lines and column sizes' do
      expect(s.lines).to eq(323)
      expect(s.cols).to eq(31)
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
        expect(s.at(10, 2)).to eq :snow
      end

      it 'says :done when line > lines' do
        expect(s.at(324, 3)).to eq :done
      end
    end

    describe('outside range lookup') do
      it 'says :tree when there is a tree' do
        expect(s.at(1, 35)).to eq :tree
      end

      it 'says :snow when there is no tree' do
        expect(s.at(7, 31)).to eq :snow
      end
    end
  end
end
