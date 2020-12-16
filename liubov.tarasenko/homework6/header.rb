require_relative 'document'

class Header < Document
  def parse
    super
    puts @doc.css('h1, h2, h3, h4, h5, h6').map(&:to_xhtml)
  end
end

Header.new('/home/luba/projects/ruby-course-2020/liubov.tarasenko/homework6/test_htmls/index.html').parse
