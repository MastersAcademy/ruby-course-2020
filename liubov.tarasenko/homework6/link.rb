require_relative 'document'
require 'nokogiri'
class Link < Document
  def parse
    super
    puts @doc.css('a').map(&:to_xhtml)
  end
end

Link.new('/home/luba/projects/ruby-course-2020/liubov.tarasenko/homework6/test_htmls/index.html').parse
