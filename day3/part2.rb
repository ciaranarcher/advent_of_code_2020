# frozen_string_literal: true

require_relative 'slope'
require_relative 'approach'

input = File.read 'input.txt'
slope = Slope.new(input)


approaches = [
  Approach.new(slope, 1, 1),
  Approach.new(slope, 3, 1),
  Approach.new(slope, 5, 1),
  Approach.new(slope, 7, 1),
  Approach.new(slope, 1, 2)
]

arr = approaches.map(&:process)
puts "Approaches: #{arr}."
trees_product = arr.reduce(:*)
puts "Answer: #{trees_product}."
