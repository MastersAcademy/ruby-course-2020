def matrix
  arr = 3.times.map{ 3.times.map { rand(-10..10) } }
  p arr
  positive = arr.flatten.select { |x| x > 0 }
  sum = positive.sum
  puts positive
  p ("sum = #{sum}")
end

matrix
