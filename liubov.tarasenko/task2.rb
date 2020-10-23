def yes
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
  count = 0
  hash.each{|k, v| 
    count +=1 if k.to_s.downcase.index("yes") == 0
  }
  p count
end

yes
