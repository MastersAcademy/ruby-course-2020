require_relative 'document'
require 'nokogiri'
class Link < Document
  def parse
    super
    trimmed_content = @doc.css('a').to_xhtml
    p trimmed_content
  end
end

links = Link.new('/home/luba/projects/ruby-course-2020/liubov.tarasenko/homework6/test_htmls/index.html').parse
