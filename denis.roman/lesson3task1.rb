class MyClass
  attr_accessor :maximum

  def initialize(max)
    @maximum = max
  end

  def result
    prime_numbers.size.times { |i| p prime_numbers.rotate(i) }
  end

  private

  def full_array
    (2..@maximum).to_a
  end

  def check_prime(elem)
    (2...elem).any? { |i| elem %(i).zero? }
  end

  def prime_numbers
    secondary_array = full_array.select { |elem| check_prime(elem) }
    full_array - secondary_array
  end

end
MyClass.new(50).result
