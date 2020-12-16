class Task2
  puts "Task 2"
  hash_yes =
    {'Yes' => 23,
     'b' => 'travel',
     'yesterday' => 34,
     5 => '234',
     yesss: :fg,
     try: 30,
     key: 'some value',
     ' yesterday1 '=> 34,
     ' yesteryear '=> 2014}
  puts "Hash 01: #{hash_yes.inspect}"
  hash_yes_arr = hash_yes.select{|key| key.to_s.start_with?(/^yes/i)}.keys
  puts "number of \"yes\" elements: #{hash_yes_arr.count}"
end