def dashatize(num)
  return unless num

  str = []
  num.to_s.split(/([02468]+|[13579])/).each_with_index do |x,i|
    if i % 2 != 0
      str << x
    end
  end
  str.join('-')
end

raise unless dashatize(6815).eql?('68-1-5')
raise unless dashatize(274).eql?("2-7-4")
raise unless dashatize(5311).eql?("5-3-1-1")
raise unless dashatize(86320).eql?("86-3-20")
raise unless dashatize(974302).eql?("9-7-4-3-02")
raise unless dashatize(nil).eql?(nil)
raise unless dashatize(0).eql?("0")
raise unless dashatize(-1).eql?("1")
raise unless dashatize(-28369).eql?("28-3-6-9")
