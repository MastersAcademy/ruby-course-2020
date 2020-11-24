class String
  def valid?
    array = []
    hash = {"{" => "}", "[" => "]", "(" => ")", "<" => ">"}
    each_char do |char|
      array << char if hash.key?(char)
      return false if  hash.key(char) &&  hash.key(char) != array.pop
    end
    array.empty?
  end
end

p "{}()<>[[]]".valid?
p "[(])".valid?
p "{{[]".valid?
p "[[]]]".valid?



