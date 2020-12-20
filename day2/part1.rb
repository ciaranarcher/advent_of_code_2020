# frozen_string_literal: true

require_relative 'policies'

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
