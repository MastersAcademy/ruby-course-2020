# frozen_string_literal: true

require 'csv'

STATS = %w[|month||aver||max||min|].freeze

class WeatherParse
  def initialize(filename)
    @filename = filename
    @data = Hash.new([])
    parser
  end

  def parser
    parse = CSV.foreach(@filename, headers: true, converters: :all)
    parse.each do |row|
      @data[row['date'].strftime('%m-%y')] += [row['degrees']]
    end
  end

  def create_csv
    CSV.open('res.csv', 'w', write_headers: true, headers: STATS) do |csv|
      @data.collect { |k, v| csv << [k, (v.sum.to_f / v.size).round(2), v.max, v.min] }
    end
  end
end

my_parse = WeatherParse.new('./test.csv')
my_parse.create_csv
