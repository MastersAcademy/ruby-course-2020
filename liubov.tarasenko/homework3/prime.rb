class PrimeMatrix
  def initialize(max)
    @max = max
  end
  
  def prime_arr
    base = [2,3,5,7].select { |x| x <= @max }    
    rest = (2..@max).to_a.reject { |x| base.any? { |b| x % b == 0 } }
    base + rest
  end

  def print_arr
    puts calculate.map { |el| el.join(" ") }
  end

  def calculate
    all = prime_arr
    prime_matrix = Array.new(all.size) { |i| all.rotate(i) }
  end
end

m = PrimeMatrix.new(100)
m.print_arr
