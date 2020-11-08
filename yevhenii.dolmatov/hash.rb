hash = {
  'Yes' => 23,
  'b' => 'travel',
  'yesterday' => 34,
  5 => '234',
  yesss: :fg,
  try: 30,
  key: 'some value',
  ' yesterday1 ' => 34,
  ' yesteryear ' => 2014
  }

amount = hash.keys.count { |key| key.to_s.downcase.start_with?('yes') }
puts "The number of keys in the hash whose value starts with 'yes': #{amount}."
