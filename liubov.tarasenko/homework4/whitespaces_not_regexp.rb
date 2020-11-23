# frozen_string_literal: true

def fetch_groups(str)
  str = str.strip
  n = 0
  groups = []

  str.each_char do |e|
    if e == ' '
      n += 1
    else
      groups << n
      groups << e
      n = 0
    end
  end
  groups
end

def loneliest(str)
  groups = fetch_groups(str)
  res = []
  groups.each.with_index do |e, i|
    if e.is_a?(String)
      sum = groups[i - 1] + groups[i + 1].to_i
      res << { char: e, sum: sum }
    end
  end
  max = res.max_by { |h| h[:sum] }
  res.select { |h| h[:sum] == max[:sum] }.map { |h| h[:char] }
end

raise unless loneliest('a').sort.eql?(['a'])
raise unless loneliest('abc d   ef  g   h i j      ').sort.eql?(['g'])
raise unless loneliest('a   b   c ').sort.eql?(['b'])
raise unless loneliest('  abc  d  z    f gk s ').sort.eql?(['z'])
raise unless loneliest('a  b  c  de  ').sort.eql?(%w[b c])
raise unless loneliest('abc').sort.eql?(%w[a b c])
