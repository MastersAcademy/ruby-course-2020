# Заповнити випадковими числами від -10 до 10 двовимірний масив 3х3 елементів
arr = Array.new(3) { Array.new(3) { rand -10..10 } }
p arr
# Перетворимо багатовимірний масив в одновимірний і знаходимо все позитивні числа
arr1 = arr.flatten.find_all { |el| el > 0 }
puts arr1
print "Summa = "
puts arr1.sum
