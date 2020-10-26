class Task1

  b = Array.new(3, Array.new(3, 0))
  # b = [[0,0,0],[0,0,0],[0,0,0]]
  b = b.map {|el| el.map {rand(-10..10)}}
  positivearr = b.map {|el| el.map {|elm| elm > 0 ? elm : 0} }

  p "Task 1"
  p "Array 01: " + b.inspect
  b.select {|el| el.select {|elm| puts "#{elm}" if elm > 0} }
  amount = 0
  positivearr.select {|el| el.select {|elm| amount += elm } }

  p "Array 02: " + positivearr.inspect
  p "Amount: #{amount}"
  p "***********************************************************"
  p "Task 2"
  h = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value',
       ' yesterday1 '=> 34,' yesteryear '=> 2014}
  p "Hash 01: " + h.inspect
  number_elements = 0
  h.each do |element, count|
    if element.to_s.start_with? (/^yes/)
      number_elements += 1
      puts "#{element.to_s} : #{count}"
    end

  end
  p "number of \"yes\" elements: #{number_elements}"
end