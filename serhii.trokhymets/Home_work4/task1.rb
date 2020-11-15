def dashatize (numbers)
  return if numbers.nil?
  result = numbers.abs.to_s.each_char.map do |n|
    if n.to_i.odd?
      n = "-#{n}-"
    else
      n = n
    end
  end
  result = result.join
  result = result.chop if result.end_with?('-')
  result = result.slice(1..-1) if result.start_with?('-')
  result.gsub!('--', '-')
  p result
end

raise unless dashatize(5311).eql?("5-3-1-1")
raise unless dashatize(86320).eql?("86-3-20")
raise unless dashatize(-974302).eql?("9-7-4-3-02")
raise unless dashatize(nil).eql?(nil)
raise unless dashatize(0).eql?("0")
raise unless dashatize(-1).eql?("1")
raise unless dashatize(-28369).eql?("28-3-6-9")
