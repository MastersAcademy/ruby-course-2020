class String
  def valid?
    string = self.gsub(/[^\[\]\<\>\(\)\{\}]/, '')
    return true if string.empty?
    return false if string.size.odd?

    loop do
      str = string.gsub('()', '').gsub('<>', '').gsub('{}', '').gsub('[]', '')
      return true if str.empty?
      return false if str.eql?(string)

      string = str
    end
  end
end

p '{(})'.valid? #=> false
p '{{[]'.valid? #=> false
p '{[()]}'.valid? #=> true
