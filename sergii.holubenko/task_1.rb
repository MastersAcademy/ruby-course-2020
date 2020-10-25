arr = [a, b, c]
a = []
3.times do
  arr.push(rand(-10...10))
end
b = []
3.times do
  arr.push(rand(-10...10))
end
c = []

3.times do
  arr.push(rand(-10...10))
end
d = []
arr.each do |i|
  if i > 0
    d.push(i)
    print i
  end
end
print d.sum


  