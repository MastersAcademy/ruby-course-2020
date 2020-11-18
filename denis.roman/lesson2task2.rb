class String
  def valid?
    brackets =
        { "(" => ")",
          "<" => ">",
          "{" => "}",
          "[" => "]" }
    if brackets.values.include?(self[0,1])
      return false
    else
      arr_brack = []
      each_char do |b|
        arr_brack.push(b) if brackets.key?(b)
        if brackets.values.include?(b) && brackets[arr_brack.last] == b
          arr_brack.pop
        end
      end
      arr_brack.empty?
    end    
  end
end
p "{(})".valid?
p "{{[]".valid?
p "{[()]}".valid?
