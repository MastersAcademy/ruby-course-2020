def dashatize(number)
  return nil if number.nil?
  number = -number if number.negative?
  return number.to_s if number.to_s.length == 1
  pred_char = ''
  str_result = ''
  number.to_s.chars.map.with_index do |char, index|
    if char.to_i.odd?
      case index
      when 0
        str_result+= char+'-'
      when number.to_s.size-1
        if pred_char.to_i.odd?
          str_result+= char
        else
          str_result+= '-'+char
        end
      else
        if pred_char.to_i.odd?
          str_result+= char+'-'
        else
          str_result+= '-'+char+'-'
        end
      end
    else
      str_result+= char
    end
    pred_char = char
  end
  str_result
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
