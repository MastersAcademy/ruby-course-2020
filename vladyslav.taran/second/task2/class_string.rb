class String
  def valid?
    return true if empty?

    substitute = gsub(/\(\)|\[\]|\{\}|\<\>/, '')
    return false if substitute == self

    substitute.valid?
  end
end

p '{(})'.valid?
p '{{[]'.valid?
p '{[()]}'.valid?
