require 'nokogiri'
filename = 'index.html'
html = File.read(filename)

File.read(filename)

class Document
  def self.parse(html)
    html
    Nokogiri::HTML.parse(html).css(self::TAG_NAME)
  end
end

class Link < Document
  TAG_NAME = "a"
end

class Header < Document
  TAG_NAME = "h2"
end

puts Header.parse(html)
puts Link.parse(html)
