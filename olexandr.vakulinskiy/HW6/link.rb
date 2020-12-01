class Link < Document
  def parse_html
    links = super.xpath('//a/@href')
    links.map { |link| puts link.value }
  end
end
