class String
  def valid?
    brackets = { "(" => ")", "<" => ">", "{" => "}", "[" => "]" }
    brackets_stack = []
    each_char do |x|
      brackets_stack.push(x) if brackets.key?(x)
      if brackets.values.include?(x)
        brackets_stack.pop if brackets[brackets_stack.last] == x
      end
    end
    brackets_stack.empty?
  end
end

input_str = gets.chomp
p input_str.valid?
