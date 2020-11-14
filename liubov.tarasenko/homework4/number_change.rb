# frozen_string_literal: true

def dashatize(num)
  return if num.nil?

  res = num.abs.to_s.each_char.map { |n| n.to_i.odd? ? ['-', n, '-'] : n }.flatten.join
  res = res.chop if res.end_with?('-')
  res = res[1..-1] if res.start_with?('-')
  res.gsub!('--', '-')
  res
end

raise unless dashatize(6815).eql?('68-1-5')
raise unless dashatize(274).eql?('2-7-4')
raise unless dashatize(5311).eql?('5-3-1-1')
raise unless dashatize(86_320).eql?('86-3-20')
raise unless dashatize(974_302).eql?('9-7-4-3-02')
raise unless dashatize(nil).eql?(nil)
raise unless dashatize(0).eql?('0')
raise unless dashatize(-1).eql?('1')
raise unless dashatize(-28_369).eql?('28-3-6-9')
