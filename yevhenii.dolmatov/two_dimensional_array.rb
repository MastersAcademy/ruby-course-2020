two_dimensional_array = Array.new(3) {Array.new(3) {rand(-10..10)}}
sum_of_positive_numbers = 0

two_dimensional_array.each do |i|
  i.each do |k|
    if k > 0
      puts k
      sum_of_positive_numbers += k
    end
  end
end

puts "The sum of positive numbers in two dimensional array are #{sum_of_positive_numbers}."