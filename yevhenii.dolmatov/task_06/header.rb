# frozen_string_literal: true

require './document'

# implementation of Header class that extends the class Document
class Header < Document
  def parse
    super
    @document.xpath('//h2').map(&:inner_html)
  end
end

h2 = Header.new('index.html')
puts h2.parse
