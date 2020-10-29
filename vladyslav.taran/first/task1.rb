p arr = Array.new(3) {Array.new(3) {rand(-10..10)}}
p arr2 = arr.flatten.find_all {|elem|elem >0}
puts arr2.sum
