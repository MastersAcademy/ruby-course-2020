require 'csv'

class Temperature

  def initialize
    new_file
    result
  end

  def parse
    csv = File.read('temperature.csv')
    CSV.parse(csv, headers: true)
  end

  def new_file
    CSV.open('result.csv', 'w', headers: true) do |csv|
      csv << [ :month, :average, :max, :min ]
    end
  end

  def result
    all_temp_for_month = []
    month = parse.by_row[0]['date'].split('-')[1]
    parse.by_row.each do |line|
      if month.eql?(line['date'].split('-')[1])
        all_temp_for_month << line['degrees'].to_i
      else
        all_temp_for_month << month
        month = line['date'].split('-')[1]
        add_info_to_result(all_temp_for_month)
        all_temp_for_month = [] << line['degrees'].to_i
      end
    end
    all_temp_for_month << month
    add_info_to_result(all_temp_for_month)
  end

  def add_info_to_result(temp)
    result = []
    result << temp.pop
    average = temp.sum.to_f/temp.size
    result << average.round(1) << temp.max << temp.min
    CSV.open('result.csv', 'a') do |csv|
      csv << result
    end
  end
end

Temperature.new
