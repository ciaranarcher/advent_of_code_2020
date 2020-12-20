require_relative 'policies'

context PwdPolicy do
  describe 'invalid policy' do
    it 'fails with an invalid policy' do
      expect { PwdPolicy.new('12-12-12') }.to raise_error('invalid policy code')
    end
  end

  describe 'valid policy' do
    let(:policy) { PwdPolicy.new('2-5 c') }

    it 'has a min number of chars' do
      expect(policy.min).to eq 2
    end

    it 'has a max number of chars' do
      expect(policy.max).to eq 5
    end

    it 'has a character' do
      expect(policy.letter).to eq 'c'
    end
  end

  describe '#check' do
    let(:policy) { PwdPolicy.new('2-5 c') }

    it 'is abstract; use a sub-class' do
      expect { policy.check('abc') }.to raise_error(ArgumentError)
    end
  end
end

describe PwdCountPolicy do
  context 'valid policy' do
    let(:policy) { PwdCountPolicy.new('2-5 c') }

    describe '#check' do
      let(:policy) { PwdCountPolicy.new('2-5 c') }

      describe 'valid pwd' do
        it 'accepts pwds matching policy' do
          expect(policy.check('ycyccik')).to be true
          expect(policy.check('yccyccik')).to be true
          expect(policy.check('yccyccikc')).to be true
        end
      end

      describe 'invalid pwd' do
        it 'rejects pwds not matching policy' do
          expect(policy.check('yyikkwer')).to be false
          expect(policy.check('ycickccrcccc')).to be false
        end
      end
    end
  end
end

describe PwdPositionPolicy do
  context 'valid policy' do
    let(:policy) { PwdPositionPolicy.new('2-5 c') }

    describe '#check' do
      describe 'valid pwd' do
        it 'accepts pwds matching policy' do
          expect(policy.check('tceerff')).to be true
          expect(policy.check('jdnucokk')).to be true
        end
      end

      describe 'invalid pwd' do
        it 'rejects pwds not matching policy' do
          expect(policy.check('kcijcnf')).to be false
          expect(policy.check('jhjdfuhdd')).to be false
        end
      end
    end
  end
end
