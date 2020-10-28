p a = Array.new(3) { Array.new(3) {rand(-10..10)} }
puts a = a.flatten.find_all {|ar| ar  > 0}
p a.sum
