# frozen_string_literal: true

##
# Passwork policy definition
class PwdPolicy
  attr_reader :min, :max, :char
  VALID = /\A[0-9]*\-[0-9]* [a-z]{1}\z/.freeze
  PARTS = /([0-9]{1,3}|[a-z]{1})/.freeze

  def initialize(policy_code)
    raise 'invalid policy code' unless VALID =~ policy_code

    parts = policy_code.scan(PARTS).flatten
    @min = parts[0].to_i
    @max = parts[1].to_i
    @char = parts[2]
  end
end
