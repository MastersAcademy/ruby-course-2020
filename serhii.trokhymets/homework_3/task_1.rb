class EasyNumber
  attr_accessor :prime_arr
  attr_reader :max_value

  def initialize(max_value)
    @max_value = max_value
    @prime_arr = []
  end

  def find_prime_number
    (1..@max_value).each do |num|
      prime_arr.push(num) if (1..num).select { |d| num % d == 0 } == [1, num]
    end
  end

  def display_array
    find_prime_number
    @prime_arr.each do
      p prime_arr
      prime_arr.rotate!
    end
  end
end

prime_matrix = EasyNumber.new(10)
prime_matrix.display_array
