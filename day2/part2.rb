require_relative 'policies'

input = File.read 'input.txt'
lines = input.split("\n")

count_valid = 0

lines.each do |l|
  parts = l.split(':')
  policy = parts.first
  pwd = parts.last.strip

  count_valid += 1 if PwdPositionPolicy.new(policy).check(pwd)
end


puts "Using the POSITION policy, of #{lines.length} passwords, #{count_valid} are valid."
