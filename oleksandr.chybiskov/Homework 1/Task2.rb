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
array_2.count # the number of keys starting with "yes" sequence
