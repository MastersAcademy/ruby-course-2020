def dashatize(tor)
  return tor unless tor.is_a? Integer

  k = tor.to_s.split('').map do |x|
  if x.to_i.odd?
    '-' + x + '-'
  else
    x
  end
  end.join.gsub('--', '-')
  k.slice!(0) if k[0]=='-'  
  k.slice!(-1) if k[-1]=='-'  
  k
end
