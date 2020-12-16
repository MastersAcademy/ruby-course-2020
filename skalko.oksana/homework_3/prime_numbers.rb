class PrimeNumbers
  attr_accessor :max_number

  def initialize(arg)
    @max_number = arg
  end

  def result
    prime_numbers.size.times { |i| p prime_numbers.rotate(i) }
  end

  private

  def full_array
    (2..@max_number).to_a
  end

  def prime_numbers
    some_array = full_array.select { |elem| check(elem) }
    full_array - some_array
  end

  def check(elem)
    (2...elem).any? { |i| elem.modulo(i).eql?(0) }
  end
end

PrimeNumbers.new(10).result
