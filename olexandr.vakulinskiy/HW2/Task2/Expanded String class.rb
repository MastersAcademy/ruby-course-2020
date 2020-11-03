class String
  def valid?
    brackets = { "(" => ")", "<" => ">", "{" => "}", "[" => "]" }
    brackets_stack = []
    self .each_char do
      |x| brackets_stack.push(x) if brackets.keys.include?(x)
    brackets_stack.pop if brackets.values.include?(x)
    end
    brackets_stack.empty?
  end
end

input_str = gets.chomp
p input_str.valid?
