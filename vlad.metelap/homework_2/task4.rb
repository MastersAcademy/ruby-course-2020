class String
  def valid?
    brackets_hash = { ')' => '(', ']' => '[', '}' => '{', '>' => '<' }
    string_arr = chars
    arr = []
    string_arr.each do |char|
      if closed_bracket?(char)
        return false unless brackets_hash[char] == arr.pop
      else
        arr.push(char)
      end
    end
    arr.length.zero?
  end

  def closed_bracket?(char)
    [')', ']', '}', '>'].include?(char)
  end
end

puts 'Test:'
puts "[({})] - #{'[({})]'.valid?}"
puts "{(}) - #{'{(})'.valid?}" #=> false
puts "{{[] - #{'{{[]'.valid?}" #=> false
puts "{[()]} - #{'{[()]}'.valid?}" #=> true
