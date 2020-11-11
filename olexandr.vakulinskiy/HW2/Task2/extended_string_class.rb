class String
  def valid?
    brackets = { '(' => ')', '<' => '>', '{' => '}', '[' => ']' }
    brackets_stack = []
    each_char do |x|
      brackets_stack.push(x) if brackets.key?(x)
      brackets_stack.pop if brackets.values.include?(x) && brackets[brackets_stack.last] == x
    end
    brackets_stack.empty?
  end
end

input_str = gets.chomp
p input_str.valid?
