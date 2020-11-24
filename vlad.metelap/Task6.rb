class Task6
  attr_accessor :max_num

  def initialize(max_num)
    @max_num = max_num
  end

  def simple_numbers
    lst = []
    k = 0
    (2...@max_num + 1).each do |index_i|
      (2...index_i).each do |index_j|
        if (index_i % index_j).zero?
          k += 1
          break
        end
      end
      if k.zero?
        lst.append(index_i)
      else
        k = 0
      end
    end
    lst
  end

  def final_matrix
    simple_arr = simple_numbers
    p simple_arr
    (simple_arr.length - 1).times do
      p simple_arr.rotate!(1)
      # p simple_arr << simple_arr.shift
    end
  end
end

matrix = Task6.new(10)
# p matrix.simle_numbers
matrix.final_matrix

