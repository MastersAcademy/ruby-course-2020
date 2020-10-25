a=0
Array.new(3){ Array.new(3) {(-10..10).to_a.sample}}.each do |n| 
      n.each do |r|
       if r>0 
    puts r 
    a=r+a
   end
  end
end
puts a
