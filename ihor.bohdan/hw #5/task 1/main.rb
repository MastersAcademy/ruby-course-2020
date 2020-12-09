# frozen_string_literal: true

require 'csv'

HEADERS = %w[month-year avg max min].freeze

class Operations
  def initialize(file)
    @file = file
    @month_temp = Hash.new([])
    parse
  end

  def output
    CSV.open('output.csv', 'w', write_headers: true, headers: HEADERS) do |csv|
      @month_temp.map { |k, v| csv << [k, v.sum / v.size, v.max, v.min] }.to_s
    end
  end

  private

  def csv
    @csv ||= CSV.read(@file, headers: true, converters: :all)
  end

  def parse
    csv.map do |row|
      @month_temp[row['date'].strftime('%m-%Y')] += [row['degrees']]
    end
  end
end
