hash = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014}
arr = hash.select { |k| k.to_s.downcase.start_with? "yes" }.keys
p arr.length
