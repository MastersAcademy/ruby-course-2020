class String
  def valid?
        substitute = gsub(/\(\)|\[\]|\{\}|\<\>/, '')
    return false if substitute == self
    substitute.valid?
  end
end
p '{(})'.valid?
p '{{[]'.valid?
p '{[()]}'.valid?
