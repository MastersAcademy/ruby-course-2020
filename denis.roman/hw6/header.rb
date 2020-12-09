class Header < Document
  def parse_html
    headers = super.xpath('//h2')
    headers.map { |header| puts header.text }
  end
end
