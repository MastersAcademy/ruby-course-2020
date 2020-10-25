p hash = {
          'Yes' => 23,
          'b' => 'travel',
          'yesterday' => 34,
           5 => '234',
           yesss: :fg,
           try: 30,
           key: 'some value',
          ' yesterday1 '=> 34,
          ' yesteryear '=> 2014
}

keys = hash.transform_keys{|k| k.to_s}.keys

puts "\nAmount of keys, which start with \"yes\""
p keys.map{|key|  key.downcase.match(/^yes/)}.compact.size
