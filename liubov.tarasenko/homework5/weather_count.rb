require 'csv'
require 'date'
class WeatherCount
  def initialize(path)
    @path = path
  end

  def parse
    date = CSV.read(@path)
    date.shift
    date.map! { |el| { date: Date.parse(el.first), number: el.last.to_i } }
    month_groups = date.group_by { |h| h[:date].month }
  end

  def count
    month_groups = parse
    month_groups.map do |month, temps|
      h = { month: month }
      enum = temps.map { |h| h[:number] }
      h[:avg] = (enum.sum.to_f / temps.size).round(2)
      h[:max] = enum.max
      h[:min] = enum.min
      h
    end
  end

  def write_new_file
    res = count
    CSV.open('new.csv', 'w') do |csv|
      csv << res.first.keys
      res.each { |h| csv << h.values }
    end
  end
end
w = WeatherCount.new('/home/luba/projects/ruby-course-2020/liubov.tarasenko/homework5/test.csv')
w.write_new_file
