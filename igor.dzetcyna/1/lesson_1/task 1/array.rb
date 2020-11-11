# Fill with random numbers from -10 to 10 two-dimensional array of 3x3 elements.
arr = Array.new(3) { Array.new(3) { rand -10..10 } }
p arr
# Convert a multidimensional array into a one-dimensional one and find all positive numbers.
arr1 = arr.flatten.find_all { |el| el > 0 }
puts "Summa = #{arr1.sum}"
