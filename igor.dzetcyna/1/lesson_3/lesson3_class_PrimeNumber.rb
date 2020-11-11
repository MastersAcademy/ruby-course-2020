class PrimeNumber

  def initialize(max_value)
    @value = max_value
    @prime_arr = []
  end

  def find_prime_numbers
    (2..@value).each do |n|
      if (1..n).find_all { |el| n % el == 0 } == [1, n]
        prime_arr.push(n)
      end
    end
  end

  def number_array
    find_prime_numbers
    (1..4).each do
      p prime_arr
      prime_arr.push(prime_arr.shift)
    end
  end

  private
  attr_accessor :prime_arr

  prime_matrix = PrimeNumber.new(10)
  prime_matrix.number_array

end
