class PrimeNumbers
  def is_prime?(num)
    return false if num <= 1
    Math.sqrt(num).to_i.downto(2).each { |i| return false if num % i == 0 }
    true
  end

  def output(max_value)
    prime_numbers = (0..max_value).select { |num| is_prime?(num) }
    prime_numbers.count.times do |i|
      string = (prime_numbers[i...prime_numbers.count] + prime_numbers[0...i])
      string.each do |i|
        print "#{i} #{',' unless i == string.last} "
      end
      puts
    end
  end
end

m = PrimeNumbers.new
m.output(10)
