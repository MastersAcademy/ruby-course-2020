require './document'

class Header < Document
  def parse
    super
    @parse.xpath('//h2').map(&:content)
  end
end
