require 'matrix'
class PrimeNumbers
  attr_reader :matrix

  def initialize(max_num)
    @num = max_num
    @matrix = matrix
    fill_matrix(primes)
  end

  private

  def primes
    array = []
    (1..@num).each do |number|
      array.push(number) if (1..number).select { |d| (number % d).zero? } == [1, number]
    end
    array
  end

  def fill_matrix(row)
    rotation_count = row.size - 1
    count = 0
    until count > rotation_count
      @matrix = if count.zero?
        Matrix.rows(@matrix.to_a << row)
      else
        Matrix.rows(@matrix.to_a << row.rotate(count))
      end
      count += 1
    end
  end
end
test_matrix = PrimeNumbers.new(10)
p test_matrix.matrix
