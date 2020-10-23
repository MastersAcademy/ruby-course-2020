# Task 1.1. Fill with random numbers from -10 to 10 two-dimensional array of 3x3 elements
array = Array.new(3) { Array.new(3) { rand -10..10 } }
p array

# Task 1.2. Calculate the sum of all positive elements
p array.flatten.find_all{|i| i>0}.inject{|i,sum| i+sum}

# Task 1.3. If there is a positive element - display in the console
array.flatten.each do |i|
  if i>0
    puts i
  end
end


# Task 2. Find the number of keys in hash, whose value starts with “yes”
hash = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg,
        try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014 }

result = hash.keys.select { |key| key.to_s.match(/^yes/i) }
p result.size



