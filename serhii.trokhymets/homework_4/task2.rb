def num_char(str)
  str = str.strip
  n = 0
  array = []

  str.each_char do |char|
    if char == ' '
      n += 1
    else
      array << n
      array << char
      n = 0
    end
  end
  array
end

def loneliest(str)
  array = num_char(str)
  res = []
  array.each.with_index do |e, i|
    if e.is_a?(String)
      sum = array[i - 1] + array[i + 1].to_i
      res << { char: e, sum: sum }
    end
  end
  max = res.max_by { |h| h[:sum] }
  res.select { |h| h[:sum] == max[:sum] }.map { |h| h[:char] }
end

raise unless loneliest('a').sort.eql?(['a'])
raise unless loneliest('abc d   ef  g   h i j      ').sort.eql?(['g'])
raise unless loneliest('a   b   c').sort.eql?(['b'])
raise unless loneliest('  abc  d  z    f gk s ').sort.eql?(['z'])
raise unless loneliest('a  b  c  de  ').sort.eql? %w[b c]
raise unless loneliest('abc').sort.eql? %w[a b c]
