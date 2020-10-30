class String
  def valid?
      check_str
      @opened_arr.join ==  @closed_arr.join.reverse
  end

  def check_str
    @opened_arr = []
    @closed_arr = []
    self.each_char{ |char|
     if( char == '{' )|| ( char == '<' ) || ( char == '(' ) || ( char == '[' )
      @opened_arr << char
     elsif ( char == '}' )|| ( char == '>' ) || ( char == ')' ) || ( char == ']' )
      reverse_char = '{' if char == "}"
      reverse_char = '<' if char == ">"
      reverse_char = '[' if char == "]"
      reverse_char = '(' if char == ")"
      @closed_arr << reverse_char
     else
      continue
     end
    }
  end
end
puts '<<}'.valid?
puts '<<}>'.valid?
puts '<<}>>'.valid?
puts '<<{}>>'.valid?
puts '<([{})]>>'.valid?
puts '<<{([])}>>'.valid?