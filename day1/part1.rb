# frozen_string_literal: true

input = File.read 'input.txt'

numbers = input.split("\n")

(0...numbers.length).each do |n|
  (0...numbers.length).each do |m|
    sum = numbers[n].to_i + numbers[m].to_i
    if sum == 2020
      product = numbers[n].to_i * numbers[m].to_i
      puts "#{numbers[n]} + #{numbers[m]} == 2020; product is #{product}"
      exit(0)
    end
  end
end
