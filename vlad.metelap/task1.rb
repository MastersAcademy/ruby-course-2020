class Task1
  random_array = Array.new(3) {Array.new(3){rand(-10..10)}}
  puts "Task 1"
  puts "Array 01: #{random_array.inspect}"
  positive_arr = random_array.flatten.filter_map{|elm| elm if elm.positive?}
  positive_arr.map{|elm| puts "#{elm}" if elm.positive?}
  puts "Positive array: #{positive_arr.inspect}"
  puts "Amount: #{positive_arr.sum}"
end