# frozen_string_literal: true

require 'csv'
require 'date'

csv = 'test.csv'
table = CSV.read(csv)
table.shift
hash = {}

table.each do |date, temp|
  dat = Date.parse(date)
  hash[dat.month] ||= []
  hash[dat.month] << temp.to_i
end

hash_month_aver = {}
hash_month_max = {}
hash_month_min = {}

hash.each do |date, temp|
  ttt = temp.inject(0) { |res, elem| res + elem } / temp.size
  hash_month_aver[date] ||= ttt
  hash_month_max[date] ||= temp.max
  hash_month_min[date] ||= temp.min
end

hash_month_aver
hash_month_max
hash_month_min

CSV.open('hw5.csv', 'w') do |csv|
  csv << %w[August September October November]
  csv << hash_month_aver.keys
  csv << hash_month_aver.values
  csv << hash_month_max.values
  csv << hash_month_min.values
end
