# Find the number of keys in hash, whose value starts with “yes”
hash = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg,
        try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014 }

result = hash.keys.select { |key| key.to_s.match(/^yes/i) }
p result.size
