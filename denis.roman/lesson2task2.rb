# frozen_string_literal: true

class String
  def valid?
    brackets =
      { '(' => ')',
        '<' => '>',
        '{' => '}',
        '[' => ']' }
    if brackets.values.include?(self[0, 1])
      false
    else
      arr_brack = []
      each_char do |b|
        arr_brack.push(b) if brackets.key?(b)
        arr_brack.pop if brackets.values.include?(b) && brackets[arr_brack.last] == b
      end
      arr_brack.empty?
    end
  end
end
p '{(})'.valid?
p '{{[]'.valid?
p '{[()]}'.valid?
