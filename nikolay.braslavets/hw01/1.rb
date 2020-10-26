array = Array.new(3) { Array.new(3) { rand(-10..10) } }
puts  "We created new array: #{array}"

array.flatten.select(&:positive?).each { |number| puts "Find positive number is: #{number}" }

sumPositive = array.flatten.select(&:positive?).sum
p "Sum of all positive number is: #{sumPositive}"
