class Dash
  attr_reader :output_str

  def initialize(num)
    @num = num.to_s
    @output_str = ""
    remove_bookends
    add_dashes_case
  end

  private

  def add_dashes_case
    @num.each_char do |c|
      case (c.to_i % 2).zero?
      when false
        case c
        when @num[-1] &&  @num[0]
          @output_str = c
        when @num[0]
          @output_str = c + '-'
        when @num[-1]
          if @output_str[-1] == '-'
            @output_str += c
          else
            @output_str += '-' + c
          end
        else
          if @output_str[-1] == '-'
            @output_str += c + '-'
          else
            @output_str += '-' + c + '-'
          end
        end
      when true
        @output_str += c
      end
    end
  end

  def remove_bookends
    @num = @num.delete_prefix("-") if @num[0].eql?("-")
    @num = str.chop if @num[-1].eql?("-")
  end
end

input_str = gets.chomp
str_with_dashes = Dash.new(input_str)
p str_with_dashes.output_str
