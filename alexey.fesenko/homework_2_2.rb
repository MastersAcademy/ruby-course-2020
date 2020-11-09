class String

  def valid?
    if self.length.odd?
      return false
    end
    iteration = self.length / 2
    index = 0
    index_last = self.length

    while iteration != 0
      start_symbol = self[index]
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
      stop_symbolcheck = self[index_last - 1]
      if stop_symbol != stop_symbolcheck
        return false
      end
      iteration -= 1
      index += 1
      index_last -= 1
    end
    true
  end
end

#p "({[]})".valid?
#p "{}()[]".valid?
#p "{{}{{{}".valid?
#p "<({[]})>".valid?
