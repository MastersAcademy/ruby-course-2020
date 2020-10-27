arr = Array.new(3) { Array.new(3) { rand(-10..10) } }.flatten
arr.each do |i|
     puts i if i.positive?
      end
 arr.reject! { |x| x < 0 }
summa = arr.inject(0) { |res, elem| res + elem } 
p summa
