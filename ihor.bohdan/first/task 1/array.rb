# frozen_string_literal: true

puts even = Array.new(3) { Array.new(3) { rand(-10..10) } }.flatten.select { |x| x if x.even? }
p even.reduce(:+)
