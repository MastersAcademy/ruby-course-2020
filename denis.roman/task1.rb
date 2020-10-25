Arr = Array.new(3) { Array.new(3) { rand -10...10 } }
p Arr
positive_numbers=Arr.flatten.select(&:positive?) 
puts "positive numbers are " + positive_numbers.to_s
sum = positive_numbers.sum
puts  "sum of positive is "  + sum.to_s
