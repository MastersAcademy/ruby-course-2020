class String
  def valid?
    brackets_hash = {")"=>"(", "]"=>"[", "}"=>"{", ">"=>"<"}
    string_arr = self.chars
    st = []
    string_arr.each do |ch|
      if isClosedBracket?(ch)
        if brackets_hash[ch] != st.pop
          return false
        end
      else
        st.push(ch)
      end

    end
    st.length == 0
    # puts "#{st}"
  end

  def isClosedBracket?(ch)
    [")", "]", "}", ">"].include?(ch)
  end
end
puts "[({})]".valid?
puts "{(})".valid? #=> false
puts "{{[]".valid? #=> false
puts "{[()]}".valid? #=> true
