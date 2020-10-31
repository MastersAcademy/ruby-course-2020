class String
  def valid?
    mirrored = { "[" => "]", "{" => "}", "(" => ")" }
    open_brackets = Array.new
    split_array = split("")
    split_array.each do |bracket|
      if bracket.match(/[\[|\{|\(]/) then open_brackets.push(bracket)
      elsif bracket.match(/[\]|\}|\)]/)
        return false if mirrored[open_brackets.pop] != bracket
      end
    end
    open_brackets.empty?
  end
end

# for example
p "()[]{}".valid?
p "((()))".valid?
p "(({]]]".valid?


