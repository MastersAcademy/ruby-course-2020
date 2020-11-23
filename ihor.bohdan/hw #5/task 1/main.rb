# frozen_string_literal: true

require 'csv'

class Operations
  def initialize(file)
    @file = file
    @month_temp = Hash.new([])
    parse
  end

  def output
    CSV.open('output.csv', 'w') do |csv|
      csv << %w[month avg max min]
      @month_temp.map { |k, v| csv << [k, v.sum / v.size, v.max, v.min] }.to_s
    end
  end

  private

  def csv
    @csv ||= CSV.read(@file, headers: true)
  end

  def parse
    csv.map do |row|
      date = Date.parse row['date']
      @month_temp[date.mon] += [row['degrees'].to_i]
    end
  end
end
