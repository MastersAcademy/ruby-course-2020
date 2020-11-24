# frozen_string_literal: true

def space_size(str)
  str.scan(/(\s)/).size
end

def space_groups(str)
  str.scan(/(?=(\s*[^\s]{1}\s*))/).sort_by { |x| space_size(x.join) }.map(&:join)
end

def loneliest(str)
  str.strip!
  groups = space_groups(str)
  groups.select { |x| space_size(x) == space_size(groups.last) }.map(&:strip)
end

raise unless loneliest('a').sort.eql?(['a'])
raise unless loneliest('abc d   ef  g   h i j      ').sort.eql?(['g'])
raise unless loneliest('a   b   c ').sort.eql?(['b'])
raise unless loneliest('  abc  d  z    f gk s ').sort.eql?(['z'])
raise unless loneliest('a  b  c  de  ').sort.eql?(%w[b c])
raise unless loneliest('abc').sort.eql?(%w[a b c])
