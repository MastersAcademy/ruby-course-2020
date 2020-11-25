# frozen_string_literal: true

require 'csv'

class CsvParser
  def initialize(file)
    @file = file
    @csv_hash = csv_to_hash
  end

  def create_csv(filename_int)
    CSV.open(filename_int, 'w',
             write_headers: true,
             headers: %w[month average max min]) do |csv|
      csv << find_month_temperature(/^.{5}08.{3}/, 'august')
      csv << find_month_temperature(/^.{5}09.{3}/, 'september')
      csv << find_month_temperature(/^.{5}10.{3}/, 'october')
      csv << find_month_temperature(/^.{5}11.{3}/, 'november')
    end
  end

  def create_csv_float(filename_float)
    CSV.open(filename_float, 'w',
             write_headers: true,
             headers: %w[month average max min]) do |csv|
      csv << find_month_temperature_float(/^.{5}08.{3}/, 'august')
      csv << find_month_temperature_float(/^.{5}09.{3}/, 'september')
      csv << find_month_temperature_float(/^.{5}10.{3}/, 'october')
      csv << find_month_temperature_float(/^.{5}11.{3}/, 'november')
    end
  end

  private

  def csv_to_hash
    CSV.read(@file, col_sep: ',').drop(1).to_h
  end

  def find_month_temperature(regex, month)
    month_temp = @csv_hash.select { |key| key.match(regex) }.values.map(&:to_i)
    avr_temp = month_temp.sum / month_temp.size
    max_temp = month_temp.max
    min_temp = month_temp.min

    [month, avr_temp, max_temp, min_temp]
  end

  def find_month_temperature_float(regex, month)
    month_temp = @csv_hash.select { |key| key.match(regex) }.values.map(&:to_i)
    avr_temp = month_temp.sum.to_f / month_temp.size
    max_temp = month_temp.max
    min_temp = month_temp.min

    [month, avr_temp.round(2), max_temp, min_temp]
  end
end

weather = CsvParser.new('/home/alex_vak/Documents/MA_ruby/ruby-course-2020/olexandr.vakulinskiy/HW5/test.csv')

weather.create_csv('weather_data_avr_int.csv')
weather.create_csv_float('weather_data_avr_float.csv')
