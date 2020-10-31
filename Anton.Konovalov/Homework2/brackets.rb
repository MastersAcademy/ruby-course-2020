class String
  def valid?
    if size.odd?
      return false
    end
      equiv = {'}' => '{', ']' => '[', ')' => '(', '>' => '<' }
      array = split('')
    while array.any?
      if equiv[array.pop] == array.shift
        next
      end
      return false
    end
    true
  end
end

# for example
puts "((}}}".valid?
puts "()".valid?
puts "[{}]".valid?
