# frozen_string_literal: true

require 'csv'

CSV_RESULT_FILENAME = 'output.csv'
CSV_TIME_FORMAT = '%m-%Y'
CSV_READ_OPTIONS = { headers: true, converters: :all }.freeze
CSV_WRITE_OPTIONS = { write_headers: true, headers: %w[month average max min] }.freeze

class ParseCsv
  attr_reader :file, :months, :csv

  def initialize(file)
    @file = file
    @months = Hash.new([])
    @csv ||= CSV.read(file, CSV_READ_OPTIONS)
  end

  def output
    CSV.open(CSV_RESULT_FILENAME, 'w', CSV_WRITE_OPTIONS) do |csv|
      months.map { |k, v| csv << format_row(k, v) }.to_s
    end
  end

  def call
    csv.map do |row|
      months[row['date'].strftime(CSV_TIME_FORMAT)] += [row['degrees']]
    end
  end

  private

  def format_row(key, value)
    [key, value.sum / value.size, value.max, value.min]
  end
end

operation = ParseCsv.new('./test.csv')
operation.call
operation.output
