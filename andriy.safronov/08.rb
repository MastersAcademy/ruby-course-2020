filename = 'test.csv'

File.open(filename, 'r') do |file|
  File.open('result.csv', 'w') do |file_new|
    file.readlines[1..-1].group_by { |element| element[5..6] }.map do |month, temperatures|
      temperatures = temperatures.map { |t| t[11..-1].to_i }
      max = temperatures.max
      min = temperatures.min
      average = temperatures.sum / temperatures.size
      file_new.write("#{month},#{average},#{max},#{min}\n")
    end
  end
end
