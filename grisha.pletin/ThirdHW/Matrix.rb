class PrimeNumbers
  def is_prime?(num)
    return false if num <= 1
    Math.sqrt(num).to_i.downto(2).each { |i| return false if num % i == 0 }
    true
  end

  def output(max_value)
    p prime_numbers = (2..max_value).select { |num| is_prime?(num) }
    (prime_numbers.size - 1).times do
      p prime_numbers.push(prime_numbers.shift)
    end
  end
end

m = PrimeNumbers.new
m.output(10)

