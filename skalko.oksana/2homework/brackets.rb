class String
  def valid?
    brack = self.chars
    hash = { '{' => '}', '[' => ']', '(' => ')', '<' => '>' }
    result = true
    if brack.size.even?
      while !brack.empty?
        if hash[brack[0]].eql?(brack[-1])
          brack.shift && brack.pop
          result = true
        elsif hash[brack[0]].eql?(brack[1])
          brack.shift(2)
          result = true
        else
          result = false
          break
        end
      end
    else
      result = false
    end
    result
  end
end

p '{()}'.valid?
p '(<)({)'.valid?
p ']'.valid?
p '(<>[{}])'.valid?
p '(){}<>[]'.valid?
