# Task 1
array = Array.new(3){ Array.new(3){rand(-10..10)}}.flatten # рандомний двовимірний масив (3 на 3)
p array
array.each do |var|
    if var > 0
        puts var
    end
end

array.reject!{ |x| x < 0} # залишаю в масиві тільки більше 0
p array
suma = array.inject(0){|result, element| result + element } # додаю значення масиву
p suma
