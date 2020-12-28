# frozen_string_literal: true

require_relative 'slope'

input = File.read 'input.txt'
slope = Slope.new(input)

count_trees = 0
line = 0
col = 0

loop do
  result = slope.at(line, col)

  break if result == :done

  count_trees += 1 if result == :tree

  line += 1
  col += 3
end

puts "Found #{count_trees} trees."
