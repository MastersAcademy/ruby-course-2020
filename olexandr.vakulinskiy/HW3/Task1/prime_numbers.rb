require 'matrix'
class PrimeNumbers
  attr_reader :max_num

  def initialize(max_num)
    @num = max_num
    @matrix = Matrix[]
  end

  def  primes
    array = []
    (1..@num).each do |number|
      if (1..number).select { |d| (number % d).zero? } == [1, number]
        array.push(number)
      end
    end
    array
  end

  def fill_matrix(row)
    rotation_count = row.size - 1
    count = 0
    until count > rotation_count
      if count.zero?
        @matrix = Matrix.rows(@matrix.to_a << row)
      else
        @matrix = Matrix.rows(@matrix.to_a << row.rotate(count))
      end
      count += 1
    end
    puts @matrix
  end
end
test_matrix = PrimeNumbers.new(10)
test_matrix.fill_matrix(test_matrix.primes)
