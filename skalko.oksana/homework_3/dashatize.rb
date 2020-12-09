def dashatize(arg)
  if arg.nil?
    arg
  else
    array = arg.to_s.chars.map { |i| odd_number(i) }
    result(dup_dash(array.join).chars).join
  end
end

def odd_number(num)
  if num.to_i.odd?
    '-' + num + '-'
  else
    num
  end
end

def dup_dash(str)
  str.squeeze('-')
end

def result(array)
  array.shift if array[0].eql?('-')
  array.pop if array[-1].eql?('-')
  array
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
