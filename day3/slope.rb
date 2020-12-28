# frozen_string_literal: true

class Slope
  attr_reader :slope, :lines, :cols

  def initialize(input)
    @slope = []
    lines = input.split("\n")

    lines.each_with_index do |line, i|
      slope[i] = line.split('')
    end

    # zero-indexed
    @lines = lines.length
    @cols = lines[0].length # assume all lines are the same length
  end

  def at(line, col)
    return :done if line > @lines - 1
    return :tree if @slope[line][col % @cols] == '#'

    :snow
  end
end
