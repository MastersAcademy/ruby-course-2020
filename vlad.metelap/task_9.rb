require 'csv'
class Csv_class
  def read_csv(file)
    arr = CSV.read(file)
    arr.shift
    arr.flatten!
  end
  def average_temperature(arr)
    temp_arr = []
    arr.each_with_index{|element, index| temp_arr << element.to_i if !index.even?}
    average_temperature = temp_arr.inject{|sum, element| sum + element }.to_f / temp_arr.size
    average_temperature
  end
end
file = "test.csv"
object_csv = Csv_class.new
arr = object_csv.read_csv(file)
average_temp = object_csv.average_temperature(arr)
puts "average temperature: #{average_temp}"
