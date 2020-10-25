arr = Array.new(3){Array.new(3){rand(-10..10)}}.flatten


arr.each do |i|
  if i.positive?
    puts i
    summ_elements += i 
    end
end







  