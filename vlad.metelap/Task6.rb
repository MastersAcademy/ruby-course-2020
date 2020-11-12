class Task_6
  attr_accessor :max_num

  def initialize(max_num)
    @max_num = max_num
  end

  def simle_numbers
    lst = []
    k = 0
    (2...@max_num + 1).each do |index_i|
      (2...index_i).each do |index_j|
        if index_i % index_j == 0
          k = k + 1
          break
        end
      end
      if k == 0
        lst.append(index_i)
      else
        k = 0
      end
    end
    lst
  end

  def get_final_matrix
    simple_arr = simle_numbers
    arr_size = simple_arr.length
    p simple_arr
    (arr_size - 1).times do
      p simple_arr.rotate!(1)
      # p simple_arr << simple_arr.shift
    end

  end
end

matrix = Task_6.new(10)
# p matrix.simle_numbers
matrix.get_final_matrix

