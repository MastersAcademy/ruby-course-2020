# Завдання 2 
# => Заданий Hash (тип ключа у кожного елемента різний)
# {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014}
# Знайти кількість ключів, значення яких починається на “yes”

hash = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014}
p hash.keys.map {|hs| hs.to_s}.count {|sw| sw.start_with?("yes")}
