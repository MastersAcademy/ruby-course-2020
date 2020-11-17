def loneliest(string)
  sequence = []
  acc = 0
  string.strip.split('').each { |x| x.eql?(' ') ? acc += 1 : (sequence << acc; sequence << x; acc = 0) }
  elements = []
  spaces = []
  sequence.each_with_index do |el, index|
    if el.is_a?(String)
      amount = sequence[index - 1].to_i + sequence[index + 1].to_i
      elements << el
      spaces << amount
    end
  end

  max_indexes = spaces.each_index.select { |i| spaces[i] == spaces.max }
  max_spaces_chars = []
  max_indexes.each { |x| max_spaces_chars << elements[x] }
  max_spaces_chars
end

raise unless loneliest('a').sort.eql?(['a'])
raise unless loneliest('abc d   ef  g   h i j      ').sort.eql?(['g'])
raise unless loneliest('a   b   c ').sort.eql?(['b'])
raise unless loneliest('  abc  d  z    f gk s ').sort.eql?(['z'])
raise unless loneliest('a  b  c  de  ').sort.eql?(['b', 'c'])
raise unless loneliest('abc').sort.eql?(['a', 'b', 'c'])
