class String
  def valid?
    if self.length.odd?
      return false
    end

    iteration = self.length / 2
    i = 0
    ii = self.length

    while iteration != 0
      start_symbol = self[i]
      if start_symbol == '('
        stop_symbol = ')'
      elsif start_symbol == '{'
        stop_symbol = '}'
      elsif start_symbol == '['
        stop_symbol = ']'
      elsif start_symbol == '<'
        stop_symbol = '>'
      else
        return false
      end
      stop_symbolck = self[ii - 1]
      if stop_symbol != stop_symbolck
        return false
      end
      iteration = iteration - 1
      i = i + 1
      ii = ii - 1
    end
    true
  end
end

#p "({[]})".valid?
#p "{}()[]".valid?
#p "{{}{{{}".valid?
#p "<({[]})>".valid?
