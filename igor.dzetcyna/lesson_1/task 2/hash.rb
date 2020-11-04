# Find the number of keys whose value starts with “yes”
hash = {
  'Yes' => 23, 
  'b' => 'travel', 
  'yesterday' => 34, 
  5 => '234', 
  yesss: :fg, 
  try: 30, 
  key: 'some value', 
  ' yesterday1 '=> 34,
  ' yesteryear '=> 2014}
number = hash.select { |keys| keys.to_s.downcase.start_with? "yes" }
print 'keys = '
p number.count
