class Dash
  attr_reader :output_str

  def initialize(num)
    @num = num.to_s
    @output_str = ''
    remove_bookends
    add_dashes_case
  end

  private

  def condition_for_last(case_value)
    @output_str += @output_str[-1] == '-' ? case_value : "-#{case_value}"
  end

  def condition_for_other(case_value)
    @output_str += @output_str[-1] == '-' ? "#{case_value}-" : "-#{case_value}-"
  end

  def case_for_odd(case_value)
    case case_value
    when @num[-1] && @num[0]
      @output_str = case_value
    when @num[0]
      @output_str = "#{case_value}-"
    when @num[-1]
      condition_for_last(case_value)
    else
      condition_for_other(case_value)
    end
  end

  def add_dashes_case
    @num.each_char do |c|
      (c.to_i % 2).zero? ? @output_str += c : case_for_odd(c)
    end
  end

  def remove_bookends
    @num = @num.delete_prefix('-') if @num[0].eql?('-')
    @num = str.chop if @num[-1].eql?('-')
  end
end

input_str = gets.chomp
str_with_dashes = Dash.new(input_str)
p str_with_dashes.output_str
