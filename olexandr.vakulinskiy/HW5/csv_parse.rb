# frozen_string_literal: true

require 'csv'

class CsvParser
  def initialize(file)
    @file = file
    @csv_hash = csv_to_hash
    @months = {}
    name_months
  end

  def create_csv(filename_float)
    CSV.open(filename_float, 'w',
             write_headers: true,
             headers: %w[month average max min]) do |csv|
      find_month_temperature_test.each { |array| csv << array }
    end
  end

  private

  def csv_to_hash
    CSV.read(@file, col_sep: ',').drop(1).to_h
  end

  def find_month_temperature_test
    results = []
    @months.each do |regexp, month|
      month_temp = @csv_hash.select { |key| key.match(regexp) }.values.map(&:to_i)
      avr_temp = month_temp.sum.to_f / month_temp.size
      max_temp = month_temp.max
      min_temp = month_temp.min
      results << [month, avr_temp.round(2), max_temp, min_temp]
    end
    results
  end

  def name_months
    @csv_hash.each_key { |key| find_month_names(key) }.keys
  end

  def find_month_names(key)
    case key
    when /^.{5}(01|02|12).{3}/
      winter_months(key)
    when /^.{5}(03|04|05).{3}/
      spring_months(key)
    when /^.{5}(06|07|08).{3}/
      summer_months(key)
    when /^.{5}(09|10|11).{3}/
      autumn_months(key)
    end
  end

  def winter_months(key)
    case key
    when /^.{5}01.{3}/
      @months[/^.{5}01.{3}/] = 'January' unless @months.key?(/^.{5}01.{3}/)
    when /^.{5}02.{3}/
      @months[/^.{5}02.{3}/] = 'February' unless @months.key?(/^.{5}02.{3}/)
    when /^.{5}12.{3}/
      @months[/^.{5}12.{3}/] = 'December' unless @months.key?(/^.{5}12.{3}/)
    end
  end

  def spring_months(key)
    case key
    when /^.{5}03.{3}/
      @months[/^.{5}03.{3}/] = 'March' unless @months.key?(/^.{5}03.{3}/)
    when /^.{5}04.{3}/
      @months[/^.{5}04.{3}/] = 'April' unless @months.key?(/^.{5}04.{3}/)
    when /^.{5}05.{3}/
      @months[/^.{5}05.{3}/] = 'May' unless @months.key?(/^.{5}05.{3}/)
    end
  end

  def summer_months(key)
    case key
    when /^.{5}06.{3}/
      @months[/^.{5}06.{3}/] = 'June' unless @months.key?(/^.{5}06.{3}/)
    when /^.{5}07.{3}/
      @months[/^.{5}07.{3}/] = 'July' unless @months.key?(/^.{5}07.{3}/)
    when /^.{5}08.{3}/
      @months[/^.{5}08.{3}/] = 'August' unless @months.key?(/^.{5}08.{3}/)
    end
  end

  def autumn_months(key)
    case key
    when /^.{5}09.{3}/
      @months[/^.{5}09.{3}/] = 'September' unless @months.key?(/^.{5}09.{3}/)
    when /^.{5}10.{3}/
      @months[/^.{5}10.{3}/] = 'October' unless @months.key?(/^.{5}10.{3}/)
    when /^.{5}11.{3}/
      @months[/^.{5}11.{3}/] = 'November' unless @months.key?(/^.{5}11.{3}/)
    end
  end
end

weather = CsvParser.new('/home/alex_vak/Documents/MA_ruby/ruby-course-2020/olexandr.vakulinskiy/HW5/test.csv')

weather.create_csv('weather_data.csv')
