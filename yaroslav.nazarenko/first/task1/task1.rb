x = Array.new(3) { Array.new(3) { rand (-10..10) } }
puts "Random array: #{x}"
x.flatten.each { |x| puts x if x > 0 }
pos_num = x.flatten(&:positive?).sum
puts "Positive numbers: #{pos_num}"
