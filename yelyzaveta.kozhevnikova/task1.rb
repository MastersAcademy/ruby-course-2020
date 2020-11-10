arr = Array.new(3) { Array.new(3) { rand(-10..10) } }
pp arr.flatten.select { |x| x.positive? }.each { |y| pp y }.sum
