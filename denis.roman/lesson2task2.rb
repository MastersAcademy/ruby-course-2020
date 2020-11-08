class String
  def valid?
    brackets =
        { "(" => ")",
          "<" => ">",
          "{" => "}",
          "[" => "]" }
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
p "{(})".valid?
p "{{[]".valid?
p "{[()]}".valid?

