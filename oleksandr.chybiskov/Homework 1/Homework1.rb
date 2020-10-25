# Задача 1 
# => Заповнити випадковими числами від -10 до 10 двовимірний масив 3х3 елементів 
# (не можна використовувати класс Matrix, використовувати rand для заповнення) 
# => Обчислити суму всіх позитивних елементів; якщо зустрічається позитивний елемент - виводити в консоль (puts)

p array = Array.new(3) { Array.new(3) { rand(-10..10) } } # creating a new 3*3 array  and filling it up with random numbers 
flat_array = array.flatten
pos_array = Array.new
flat_array.each do |i|
  if i > 0
    puts i # printing out to console a positive element value
    pos_array << i
  end
end
p sum_of_pos_el = pos_array.sum # finding out sum of all the positive elements



# Завдання 2 
# => Заданий Hash (тип ключа у кожного елемента різний)
# {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014}
# Знайти кількість ключів, значення яких починається на “yes”

hash = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014}
array_1 = hash.keys
array_2 = Array.new
array_1.each do |el|
  if el.to_s.include?("yes")
    array_2 << el
  end
end
p array_2.count # the number of keys starting with "yes" sequence