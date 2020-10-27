arr = Array.new(3) { Array.new(3) { rand(-10..10) } }
pp(arr)
res = 0
for x in 0..2
  for y in 0..2
    i = arr[x].at(y)
    puts(i) if i.positive?
    res += i if i.positive?
  end
end
pp(res)