class Task6
  attr_accessor :max_num

  def initialize (max_num)
    @max_num = max_num
  end

  def get_simle_numbers
    # вводим N
    n = @max_num
    # создаем пустой список для хранения простых чисел
    lst = []
    # в k будем хранить количество делителей
    k = 0
    # пробегаем все числа от 2 до N
    for i in 2...(n+1)
      # пробегаем все числа от 2 до текущего
      k = 0
      for j in (2...i)
        # ищем количество делителей
        k = k + 1 if i % j == 0
      end
      # если делителей нет, добавляем число в список
      if k == 0
        lst.append(i)
      else
        k = 0
      end
    end
    # выводим на экран список
    lst
  end

  def get_final_matrix
    simple_arr = get_simle_numbers
    arr_size = simple_arr.length
    p simple_arr
    (arr_size-1).times do
      p simple_arr.rotate!(1)
      # p simple_arr << simple_arr.shift
    end

  end
end

matrix = Task6.new(10)
# p matrix.get_simle_numbers
matrix.get_final_matrix

