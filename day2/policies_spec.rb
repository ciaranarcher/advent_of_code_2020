require_relative 'policies'

context 'invalid policy' do
  it 'fails with an invalid policy' do
    expect { PwdPolicy.new('12-12-12') }.to raise_error('invalid policy code')
  end
end

context 'valid policy' do
  let(:policy) { PwdPolicy.new('2-5 c') }

  it 'has a min number of chars' do
    expect(policy.min).to be 2
  end

  it 'has a max number of chars' do
    expect(policy.max).to be 5
  end

  describe '#check' do
    let(:policy) { PwdPolicy.new('2-5 c') }

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
