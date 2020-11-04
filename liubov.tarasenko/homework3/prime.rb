class PrimeMatrix
  def initialize(max)
    @max = max
  end
  
  def prime_arr
    base = [2,3,5,7]    
    rest = (2..@max).to_a.reject { |x| base.any? { |b| x % b == 0 } }
    base + rest
  end

  def print_arr
    puts calculate
  end

  def calculate
    all = prime_arr
    prime_matrix = Array.new(all.size) { all = all.rotate(1) }
    prime_matrix = prime_matrix.rotate(-1)
    prime_matrix.map { |el| el.join(" ") }
  end

end

m = PrimeMatrix.new(100)
m.print_arr
