require_relative 'document'
require 'nokogiri'
class Header < Document
  def parse
    super
    trimmed_content = []
    %w[h1 h2 h3 h4 h5 h6].each { |el| trimmed_content << @doc.css(el).to_xhtml }
    trimmed_content.delete_if { |el| el == '' }
    p trimmed_content
  end
end

Header.new('/home/luba/projects/ruby-course-2020/liubov.tarasenko/homework6/test_htmls/index.html').parse
