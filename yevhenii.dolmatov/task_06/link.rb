# frozen_string_literal: true

require './document'

# implementation of Link class that extends the class Document
class Link < Document
  def parse
    super
    @document.xpath('//a').map { |a| a[:href] }.find_all { |l| l.match(/(^http)/) }
  end
end

links = Link.new('index.html')
puts links.parse
