def dashatize(t)
  unless t.is_a? Integer
  return t
  end
  k = t.to_s.split('').map {|x|
  if x.to_i.odd?
  "-" + x + "-"
  else
  x
  end }.join.gsub("--", "-")
  if k[0]=="-"
  k.slice!(0)
  end
  if k[-1]=="-"
  k.slice!(-1)
  end
k
end
