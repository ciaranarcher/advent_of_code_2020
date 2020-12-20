# frozen_string_literal: true

##
# Passwork policy superclass. Create a subclass to use.
class PwdPolicy
  attr_reader :min, :max, :letter
  VALID = /\A[0-9]*\-[0-9]* [a-z]{1}\z/.freeze
  PARTS = /([0-9]{1,3}|[a-z]{1})/.freeze

  def initialize(policy_code)
    raise 'invalid policy code' unless VALID =~ policy_code

    parts = policy_code.scan(PARTS).flatten
    @min = parts[0].to_i
    @max = parts[1].to_i
    @letter = parts[2]
  end

  def check(_)
    raise ArgumentError, 'you are calling an abstract class!'
  end
end

##
# Policy based on a count of the letters.
class PwdCountPolicy < PwdPolicy
  ##
  # Check password against policy
  def check(pwd)
    chars = pwd.split('')
    matches = chars.filter { |char| char == @letter }
    len = matches.length

    return true if len >= @min && len <= @max

    false
  end
end

##
# Policy based on the position of letters.
class PwdPositionPolicy < PwdPolicy
  ##
  # Check password against policy
  def check(pwd)
    first_pos = (pwd[@min - 1] == @letter)
    last_pos = (pwd[@max - 1] == @letter)

    return true if first_pos ^ last_pos # xor

    false
  end
end
