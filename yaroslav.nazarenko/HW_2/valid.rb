class String
  def valid?
    return true if empty?

    brackets = gsub(/\(\)|\[\]|\{\}|\<\>/, '')

    return false if brackets == self

    brackets.valid?
  end
end

p "{(})".valid?
p "{{[]".valid?
p "{[()]}".valid?
p "[({<>})]".valid?
