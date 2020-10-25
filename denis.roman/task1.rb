random_array = Array.new(3) { Array.new(3) { rand -10...10 } }
p random_array
positive_numbers = random_array.flatten.select(&:positive?) 
puts "positive numbers are " + positive_numbers.to_s
sum = positive_numbers.sum
puts "sum of positive is "  + sum.to_s
