class String
  def valid?
    return p false  unless self.length.even?
    array = []
    hash = {"{" => "}", "[" => "]", "(" => ")", "<" => ">"}
    each_char do |char|
      array << char if hash.key?(char)
      return p false if  hash.key(char) &&  hash.key(char) != array.pop
    end
    if array.count == 0
      p true
    else
      p false
    end
  end
end

"{}()<>[[]]".valid?
"[(])".valid?
"{{[]".valid?
"[[]]]".valid?



