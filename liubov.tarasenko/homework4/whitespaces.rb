def space_size(x)
  x.scan(/(\s)/).size
end

def space_groups(s)
  s.scan(/(?=(\s*[^\s]{1}\s*))/).sort_by {|x| space_size(x.join) }.map(&:join)
end

def loneliest(s)
  s.strip!
  groups = space_groups(s)
  groups.select {|x| space_size(x) == space_size(groups.last) }.map(&:strip) 
end

raise unless loneliest("a").sort.eql?(["a"])
raise unless loneliest("abc d   ef  g   h i j      ").sort.eql?(["g"])
raise unless loneliest("a   b   c ").sort.eql?(["b"])
raise unless loneliest("  abc  d  z    f gk s ").sort.eql?(["z"])
raise unless loneliest("a  b  c  de  ").sort.eql?(["b", "c"])
raise unless loneliest("abc").sort.eql?(["a", "b", "c"])
