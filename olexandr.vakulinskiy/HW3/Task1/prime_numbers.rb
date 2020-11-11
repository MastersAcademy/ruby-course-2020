require 'matrix'
class  Matrix
  def print_matrix
    count = 0
    c_size = self.column_size
    self.each do |number|
      if count < c_size - 1
        print number.to_s + ', '
        count += 1
      else
        print number.to_s + ' '
        count += 1
      end
      if count == c_size
        print "\n"
        count = 0
      end
    end
    end
  end

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
prime_numbers = PrimeNumbers.new(10)
prime_numbers.matrix.print_matrix
