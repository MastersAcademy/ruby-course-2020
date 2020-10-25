# Fill with random numbers from -10 to 10 two-dimensional array of 3x3 elements
array = Array.new(3) { Array.new(3) { rand -10..10 } }
p array

# Calculate the sum of all positive elements
array_of_positive_numbers = array.flatten.find_all(&:positive?)
p array_of_positive_numbers.inject{ |i, sum| i + sum }

# If there is a positive element - display in the console
array.flatten.each do |i|
  if i>0
    puts i
  end
end



