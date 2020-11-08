class MyClass
  def initialize (max)
    @max=max
  end  
  def numbers
    array = []
    (2..@max).each do |num|
      if (1..num).select { |d| num % d == 0 } == [1, num]
        array.push(num)
      end
    end
    Array.new(array.size) do
      puts array.join(', ') 
      array.push(array.shift)
    end
  end  
end
MyClass.new(10).numbers
 
