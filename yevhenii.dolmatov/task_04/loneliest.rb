def build_sequence(string)
  sequence = [], acc = 0
  string.strip.split('').each do |s|
    if s.eql?(' ')
      acc += 1
    else
      sequence << acc
      sequence << s
      acc = 0
    end
  end
  sequence
end

def find_elements(string)
  elements = []
  build_sequence(string).each do |el|
    next unless el.is_a?(String)

    elements << el
  end
  elements
end

def find_spaces(string)
  spaces = []
  sequence = build_sequence(string)
  sequence.each_with_index do |el, index|
    next unless el.is_a?(String)

    spaces << sequence[index - 1].to_i + sequence[index + 1].to_i
  end
  spaces
end

def loneliest(string)
  max_spaces_chars = []
  gaps = find_spaces(string)
  elem = find_elements(string)
  max_indexes = gaps.each_index.select { |i| gaps[i].eql?(gaps.max) }
  max_indexes.each { |x| max_spaces_chars << elem[x] }
  max_spaces_chars
end

raise unless loneliest('a').sort.eql?(['a'])
raise unless loneliest('abc d   ef  g   h i j      ').sort.eql?(['g'])
raise unless loneliest('a   b   c ').sort.eql?(['b'])
raise unless loneliest('  abc  d  z    f gk s ').sort.eql?(['z'])
raise unless loneliest('a  b  c  de  ').sort.eql?(%w[b c])
raise unless loneliest('abc').sort.eql?(%w[a b c])
