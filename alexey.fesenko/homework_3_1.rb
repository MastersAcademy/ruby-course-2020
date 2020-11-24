class ArrNumbers

  def initialize (max_num)
    @max_num = max_num
    @arr = []
  end

  def simple_num
    (2..@max_num).each do |n|
      if (2..n).select { |p| n % p == 0} == [n]
        @arr.push(n)
      end
    end
    puts arr = @arr.join(', ')
    3.times do
      arr = @arr.push(@arr.shift)
      puts arr.join(', ')
    end
  end
end

#ArrNumbers.new(10).simple_num
