# frozen_string_literal: true

require_relative 'part1'

RSpec.describe PwdPolicy, '#init' do
  it 'fails with an invalid policy' do
    expect { PwdPolicy.new('12-12-12') }.to raise_error('invalid policy code')
  end

  context 'sane policy' do
    let(:policy) { PwdPolicy.new('2-5 c') }

    it 'has a min number of chars' do
      expect(policy.min).to be 2
    end

    it 'has a max number of chars' do
      expect(policy.max).to be 5
    end
  end
end
