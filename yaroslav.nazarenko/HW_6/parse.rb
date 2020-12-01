require 'nokogiri'

# Do general things
class Document
  def initialize
    @doc = Nokogiri::HTML(open('index.html'))
  end

  def parse(tag)
    @result = @doc.css(tag)
    puts "Here is all <#{tag}> elements from your file"
  end
end

# Puts links
class Link < Document
  def parse(tag)
    super
    puts @result
    puts '<-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=->'
  end
end

# Puts headers
class Header < Document
  def parse(tag)
    super
    puts @result
    puts '<-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=->'
  end
end

link = Link.new
header = Header.new

link.parse('a')
header.parse('h2')
