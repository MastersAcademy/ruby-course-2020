def space_size(str)
  str.scan(/(\s)/).size
end

def loneliest(str)
  groups = str.strip.split(/(?=(\s*\w\s*))/)
  max = groups.map(&:length).max
  groups.select { |x| x.size.eql? max }.map(&:strip).uniq
end

raise unless loneliest('a').sort.eql?(['a'])
raise unless loneliest('abc d   ef  g   h i j      ').sort.eql?(['g'])
raise unless loneliest('a   b   c ').sort.eql?(['b'])
raise unless loneliest('  abc  d  z    f gk s ').sort.eql?(['z'])
raise unless loneliest('a  b  c  de  ').sort.eql?(%w[b c])
raise unless loneliest('abc').sort.eql?(%w[a b c])
