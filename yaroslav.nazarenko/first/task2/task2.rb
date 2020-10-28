hash = {
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
keys_count = hash.keys.count { |key| key.to_s.downcase.index("yes") == 0 }
puts "Number of keys: #{ numOfkeys }"
