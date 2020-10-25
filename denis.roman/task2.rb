hash = { 'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014 }
p hash.count { |key, value| key.to_s.strip.start_with?('yes') }
