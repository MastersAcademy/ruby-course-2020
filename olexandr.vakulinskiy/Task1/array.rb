p nested_array = Array.new(3){Array.new(3) { rand(-10..10) }}

positive_num = nested_array.flatten.select(&:positive?)
puts "Positive numbers\n#{positive_num}"

sum = positive_num.inject(&:+)
puts "Total sum of positive numbers\n#{sum}"
