# frozen_string_literal: true

require 'csv'

def parse_csv_data(file)
  CSV.parse(File.read(file), headers: true)
end

def parse_to_int(data)
  CSV.parse(data.join(', '), converters: :numeric).flatten
end

def month_dates_length(dates_arr, regexp)
  dates_arr.select { |d| d.match(regexp) }.length
end

def month_temperature(temperature_arr, arr_size)
  temperature_arr.shift(arr_size)
end

def average(temp, size)
  (temp.inject(0, :+) / size.to_f).ceil(1)
end

table = parse_csv_data('test.csv')
dates = table.by_col[0]
degrees = table.by_col[1]
degrees_to_i = parse_to_int(degrees)

august_dates_size = month_dates_length(dates, /^.{5}08.{3}/)
september_dates_size = month_dates_length(dates, /^.{5}09.{3}/)
october_dates_size = month_dates_length(dates, /^.{5}10.{3}/)
november_dates_size = month_dates_length(dates, /^.{5}11.{3}/)

august_temperature = month_temperature(degrees_to_i, august_dates_size)
september_temperature = month_temperature(degrees_to_i, september_dates_size)
october_temperature = month_temperature(degrees_to_i, october_dates_size)
november_temperature = degrees_to_i.pop(november_dates_size)

average_august = average(august_temperature, august_dates_size)
max_august = august_temperature.max
min_august = august_temperature.min

average_september = average(september_temperature, september_dates_size)
max_september = september_temperature.max
min_september = september_temperature.min

average_october = average(october_temperature, october_dates_size)
max_october = october_temperature.max
min_october = october_temperature.min

average_november = average(november_temperature, november_dates_size)
max_november = november_temperature.max
min_november = november_temperature.min

CSV.open('weather.csv', 'w', write_headers: true, headers: %w[month average max min]) do |weather|
  weather << ['august', average_august, max_august, min_august]
  weather << ['september', average_september, max_september, min_september]
  weather << ['october', average_october, max_october, min_october]
  weather << ['november', average_november, max_november, min_november]
end
