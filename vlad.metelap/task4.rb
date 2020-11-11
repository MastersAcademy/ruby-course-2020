class String
  def valid?
    brackets_hash = {")"=>"(", "]"=>"[", "}"=>"{", ">"=>"<"}
    string_arr = self.chars
    st = []
    string_arr.each do |ch|
      if is_closed_bracket?(ch)
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

  def is_closed_bracket?(ch)
    [")", "]", "}", ">"].include?(ch)
  end
end

puts "Test:"
puts "[({})] - #{"[({})]".valid?}"
puts "{(}) - #{"{(})".valid?}" #=> false
puts "{{[] - #{"{{[]".valid?}" #=> false
puts "{[()]} - #{"{[()]}".valid?}" #=> true
