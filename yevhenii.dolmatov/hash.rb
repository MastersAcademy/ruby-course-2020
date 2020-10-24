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

  counter = 0
  arr_of_hash_keys = hash.keys.to_a.map! {|el| el.to_s.downcase}
  arr_of_hash_keys.each do |key| 
    if key.start_with?("yes")
      counter += 1
    end
   end
   
   puts "The number of keys in the hash whose value starts with 'yes': #{counter}" 
