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

  ##
  # Check password against policy
  def check(pwd)
    chars = pwd.split('')
    matches = chars.filter { |char| char == @char }
    len = matches.length

    return true if len >= @min && len <= @max

    false
  end
end

input = File.read 'input.txt'
lines = input.split("\n")

count_valid = 0

lines.each do |l|
  parts = l.split(':')
  policy = parts.first
  pwd = parts.last

  count_valid += 1 if PwdPolicy.new(policy).check(pwd)
end

puts "Of #{lines.length} passwords, #{count_valid} are valid."
