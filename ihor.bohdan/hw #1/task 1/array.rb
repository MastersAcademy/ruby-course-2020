# frozen_string_literal: true

puts positive = Array.new(3) { Array.new(3) { rand(-10..10) } }.flatten.select(&:positive?)
p positive.reduce(:+)
