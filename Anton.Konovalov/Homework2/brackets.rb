class String
  def valid?
    open_brackets = []
    mirrored = { '{' => '}', '[' => ']', '(' => ')', '<' => '>' }
    each_char do |b|
      open_brackets << b if mirrored.key?(b)
      return false if mirrored.key(b) && mirrored.key(b) != open_brackets.pop
    end
    open_brackets.empty?
  end
end

# for example
p '<()[]{}>'.valid?
p '<<>'.valid?
p '((<>))'.valid?
