class Matrix
  def initialize(max)
    @max = max
  end

  def array_of_primes
    @prime_array = []
    (1..@max).each do |number|
      @prime_array << number if prime?(number)
    end
    output
  end

  private

  def prime?(number)
    (1..number).select { |int| (number % int).zero? }.eql? [1, number]
  end

  def output
    p @prime_array
    @prime_array[0..-2].each { p @prime_array << @prime_array.shift }
  end
end
