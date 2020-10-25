array = Array.new(3) { Array.new(3) { rand(-10..10) } }.flatten
puts  "We created new array: #{array}"

array.select(&:positive?).each { |number| puts "Find positive number is: #{number}" }

sumPositive = array.select(&:positive?).inject(0){|sum,x| sum + x }
p "Sum of all positive number is: #{sumPositive}"
