# Задача 1 
# => Заповнити випадковими числами від -10 до 10 двовимірний масив 3х3 елементів 
# (не можна використовувати класс Matrix, використовувати rand для заповнення) 
# => Обчислити суму всіх позитивних елементів; якщо зустрічається позитивний елемент - виводити в консоль (puts)

array = Array.new(3) { Array.new(3) { rand(-10..10) } } # creating a new 3*3 array  and filling it up with random numbers 
flat_array = array.flatten
pos_array = Array.new
flat_array.each do |i|
  if i > 0
    puts i # printing out to console a positive element value
    pos_array << i
  end
end
sum_of_pos_el = pos_array.sum # finding out the sum of all the positive elements
