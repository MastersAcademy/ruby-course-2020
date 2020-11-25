# frozen_string_literal: true

def matrix
  arr = Array.new(3) { Array.new(3) { rand(-10..10) } }
  p arr
  positive = arr.flatten.select(&:positive?)
  puts positive
  p("sum = #{positive.sum}")
end
matrix
