require 'rubygems'
require 'nokogiri'

class Document
  def parse_html
    File.open('test_html.html') { |f| Nokogiri::HTML(f) }
  end
end
