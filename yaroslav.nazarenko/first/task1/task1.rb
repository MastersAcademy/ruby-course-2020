x = Array.new(3) {Array.new(3) {rand(-10..10) } }
x.flatten.each { |x| puts x if x > 0 }
