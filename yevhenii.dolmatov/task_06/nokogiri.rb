# frozen_string_literal: true

require 'nokogiri'

# implementation of Document class
class Document
  def initialize(source)
    @source = source
  end

  def parse
    @document = Nokogiri::HTML(File.open(@source))
  end
end

# implementation of Link class that extends the class Document
class Link < Document
  def parse
    super
    @document.xpath('//a').map { |a| a[:href] }.find_all { |l| l.match(/(^http)/) }
  end
end

# implementation of Header class that extends the class Document
class Header < Document
  def parse
    super
    @document.xpath('//h2').map(&:inner_html)
  end
end

links = Link.new('index.html')
puts links.parse

h2 = Header.new('index.html')
puts h2.parse
