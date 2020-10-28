arr = Array.new(3) { Array.new(3) { rand(-10..10) } }
pp(arr)
res = 0
(0..2).each do |x| 
  (0..2).each do |y| 
    i = arr[x].at(y)
    puts(i) if i.positive?
    res += i if i.positive?
  end
end
pp(res)
