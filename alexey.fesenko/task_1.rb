p arr = Array.new(3) { Array.new(3){rand(-10..10)}}
puts arr2 = arr.flatten.find_all {|el| el > 0}
p arr2.sum
