# frozen_string_literal: true

Approach = Struct.new(:slope, :right, :down) do
  def process
    count_trees = 0
    line = 0
    col = 0

    loop do
      result = slope.at(line, col)

      break if result == :done

      count_trees += 1 if result == :tree

      line += down
      col += right
    end

    count_trees
  end
end
