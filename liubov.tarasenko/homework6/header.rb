require_relative "document"
require 'nokogiri'
class Header < Document

  def parse
    super
    trimmed_content = []
    trimmed_content << @doc.css('h1').to_xhtml
    trimmed_content << @doc.css('h2').to_xhtml
    trimmed_content << @doc.css('h3').to_xhtml
    trimmed_content << @doc.css('h4').to_xhtml
    trimmed_content << @doc.css('h5').to_xhtml
    trimmed_content << @doc.css('h6').to_xhtml
    trimmed_content.delete_if { |el| el == '' }
    p trimmed_content
  end
end

headers = Header.new('/home/luba/projects/ruby-course-2020/liubov.tarasenko/homework6/test_htmls/index.html').parse