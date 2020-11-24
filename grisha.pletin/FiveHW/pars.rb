require 'csv'
require 'date'

class FileReader
  HEADERS = %w[month avg max min].freeze

  def initialize(path)
    @path = path
    @result = Hash.new([])
  end

  def process
    process_input_data
    process_output_result
  end

  private

  def process_input_data
    CSV.read(@path, headers: true).map do |el|
      @result[Date.parse(el['date']).month] += [el['degrees'].to_i]
    end
  end

  def process_output_result
    CSV.open('output.csv', 'w', write_headers: true, headers: HEADERS) do |csv|
      @result.map { |k, v| csv << [k, v.sum / v.size, v.max, v.min] }.to_s
    end
  end
end

reader = FileReader.new('test.csv')
reader.process
