r=Array.new(3){ Array.new(3) {rand (-10..10)}}.flatten.select { |r| r>0 }
puts r
puts r.reduce(:+)    
