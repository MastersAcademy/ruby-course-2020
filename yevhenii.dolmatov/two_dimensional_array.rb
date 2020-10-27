two_dimensional_array = Array.new(3) { Array.new(3) { rand(-10..10) } }.flatten!
two_dimensional_array.each { |i| puts i if i > 0 } 
two_dimensional_array.delete_if { |i| i <= 0 }

puts "The sum of positive numbers in two dimensional array are #{two_dimensional_array.reduce(:+)}."
