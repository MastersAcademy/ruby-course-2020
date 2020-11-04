class PrimeMatrix
  def initialize(max)
    @max = max
  end
  
  def prime_arr
    base = [2,3,5,7]    
    rest = (2..@max).to_a.reject {|x| base.any? {|b| x % b == 0 } }
    @all = base + rest
    #p @all
  end

  def print_arr
    puts calculate
  end

  def calculate
    prime_arr
    n = @all.size
    #prime_matrix = Array.new(n) { Array.new( @all) }
    prime_matrix = Array.new(n) { @all; @all = @all.rotate(1) }
    prime_matrix = prime_matrix.rotate(-1)
    prime_matrix.map{|el| el.join(" ")}
  end

end

m = PrimeMatrix.new(100)
m.print_arr