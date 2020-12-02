require 'nokogiri'

class Document
  def parse_html
    File.open('nokogiri.html') { |f| Nokogiri::HTML(f) }
  end
end
