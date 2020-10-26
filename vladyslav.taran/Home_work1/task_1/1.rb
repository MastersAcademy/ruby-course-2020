p arr = Array(3) {Array(3) {rand (-10..10)}}
p arr2 = arr.flatten.find_all {|elem|elem >0}
puts arr2.sum
