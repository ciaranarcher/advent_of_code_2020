class Slope
  attr_reader :slope

  def initialize(input)
    @slope = []
    lines = input.split("\n")

    lines.each_with_index do |line, i|
      slope[i] = line.split('')
    end
  end
end
