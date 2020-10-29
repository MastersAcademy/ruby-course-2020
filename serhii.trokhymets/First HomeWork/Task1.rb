# Task 1
array = Array.new(3){ Array.new(3){rand(-10..10)}}.flatten # random array (3 * 3)
p array
array.each do |var|
    if var > 0
        puts var
    end
end

array.reject!{ |x| x < 0} # array > 0 
p array
suma = array.inject(0){|result, element| result + element } # sum of array values
p suma
