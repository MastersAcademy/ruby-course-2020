h1 = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014}
h2 = h1.select {|k| k.to_s.downcase.match(/^yes/)}
puts h2.size
