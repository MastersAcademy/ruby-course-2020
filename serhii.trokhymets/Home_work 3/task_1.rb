class Easy_number

  def initialize (max_value)
    @max_value = max_value
    @prime_arr = []
    @bad_number = []
  end

  def find_prime_number
    (1..@max_value).each do |num|
      if (1..num).select { |d| num % d == 0 } == [1, num]
        prime_arr.push(num)
      end
    end
  end

  def display_array
    find_prime_number
    (1..@prime_arr.size).each do
    p prime_arr
    prime_arr.rotate!
    end
  end

  private
  attr_accessor :prime_arr, :bad_number
  attr_reader :max_value

end


prime_matrix = Easy_number.new(10)
prime_matrix.display_array



