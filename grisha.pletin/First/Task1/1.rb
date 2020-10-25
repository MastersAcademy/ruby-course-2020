a = Array.new(3){Array.new(3){rand(-10..10)}}.flatten.select { |a| a > 0 }
puts a
p a.inject(:+)
