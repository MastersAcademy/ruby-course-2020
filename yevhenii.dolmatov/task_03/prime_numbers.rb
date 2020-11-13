class PrimeNumbers
  def initialize(number)
    @number = number
  end

  def specify_prime_numbers
    prime_array = []
    (2..@number).each { |num| prime_array.any? { |i| (num % i).zero? } ? nil : prime_array.push(num) }
    prime_array
  end

  def shifting_array_elements
    Array.new(specify_prime_numbers.length) { |el| specify_prime_numbers.rotate(el) }
  end

  def print_result
    printing = shifting_array_elements.map { |s| s.join(', ') }
    puts printing
  end
end

prime_numbers = PrimeNumbers.new(10)
prime_numbers.print_result
