require './document'

class Link < Document
  def parse
    super
    @parse.xpath('//a/@href').map(&:content).select { |links| links =~ /(^http)/ }
  end
end
