class Matrix

  def initialize (max_element)
    @max_element = max_element
  end

  def prime? (int)
    (2...int).none? { |i| int.modulo(i).zero? }
  end

  def find_primes
    result = (2.upto(@max_element).select { |i| prime? i }).rotate(-1)
    result.each do |i|
      p result.push(result.shift)
    end
  end
end

a = Matrix.new(10)
a.find_primes

