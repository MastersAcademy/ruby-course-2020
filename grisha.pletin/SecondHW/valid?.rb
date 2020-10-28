class String
  def valid?
    stack = []
    brackets = { '{' => '}', '[' => ']', '(' => ')', '<' => '>' }
    each_char do |char|
      stack << char if brackets.key?(char)
      return false if brackets.key(char) && brackets.key(char) != stack.pop
    end
    stack.empty?
  end
end
p '{(})'.valid?
p '{{[]'.valid?
p '{[()]}'.valid?