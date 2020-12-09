def loneliest(string_test)
  string_test.strip!
  return string_test.split("") if string_test.length == 1
  white_space_after = 0
  arr_result = []
  string_test.chars.map do |char|
    if char == ' '
      white_space_after+= 1
    else
      arr_result[-1][1] += white_space_after unless arr_result.empty?
      arr_result << [char, white_space_after]
      white_space_after = 0
    end
  end
  arr_result.flatten!
  arr_clone = arr_result.clone
  arr_result.map!{ |element| element = (element.to_s =~ /\d/)? element: -1 }
  max_of_array = arr_result.max
  arr_result2 = []
  arr_clone.each_with_index do |value, index|
    if value == max_of_array
      arr_result2 << arr_clone[index-1]
    end
  end
  arr_result2.sort!
end

# raise unless loneliest("a").sort.eql?(["a"])
# raise unless loneliest("abc d   ef  g   h i j      ").sort.eql?(["g"])
# raise unless loneliest("a   b   c ").sort.eql?(["b"])
# raise unless loneliest("  abc  d  z    f gk s ").sort.eql?(["z"])
# raise unless loneliest("a  b  c  de  ").sort.eql?(["b", "c"])
# raise unless loneliest("abc").sort.eql?(["a", "b", "c"])
