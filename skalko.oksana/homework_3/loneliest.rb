def loneliest(str)
  array_of_strings = array_of_strings(number_of_spaces(str.strip.chars))
  max = array_of_strings.map { |i| i.size}.max
  array_of_strings.select { |i| i.size.eql?(max) }.join.chars.uniq
end

def number_of_spaces(array)
  a = 0
  new_array = []
  while array.any?
    if array[0].eql?(' ')
      a += 1
      array.shift
    else
      new_array << a
      new_array << array.shift
      a = 0
    end
  end
  new_array
end

def array_of_strings(ar)
  array = []
  while ar.any?
    int = ar[0] + ar[2].to_i
    if int.eql?(0)
      int = 1
    end
    el = ar[1] * int
    array << el
    ar.shift(2)
  end
  array
end

raise unless loneliest("a").sort.eql?(["a"])
raise unless loneliest("abc d   ef  g   h i j      ").sort.eql?(["g"])
raise unless loneliest("a   b   c ").sort.eql?(["b"])
raise unless loneliest("  abc  d  z    f gk s ").sort.eql?(["z"])
raise unless loneliest("a  b  c  de  ").sort.eql?(["b", "c"])
raise unless loneliest("abc").sort.eql?(["a", "b", "c"])
