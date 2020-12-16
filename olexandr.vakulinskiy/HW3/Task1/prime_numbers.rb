require 'matrix'

class PrimeNumbers
  def initialize(max_num)
    @num = max_num
    @matrix = Matrix[]
    fill_matrix(primes)
  end

  def print_matrix
    count = 0
    @matrix.each do |number|
      if count < @matrix.column_size - 1
        print "#{number}, "
        count += 1
      elsif count == @matrix.column_size - 1
        print "#{number} \n"
        count = 0
      end
    end
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
    mat_arr = @matrix.to_a
    until count > rotation_count
      @matrix = count.zero? ? Matrix.rows(mat_arr << row) : Matrix.rows(mat_arr << row.rotate(count))
      count += 1
    end
  end
end
prime_numbers = PrimeNumbers.new(10)
prime_numbers.print_matrix
