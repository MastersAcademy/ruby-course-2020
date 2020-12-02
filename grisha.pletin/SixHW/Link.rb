
require './HTMLparse'

class Link < Document
  def parse
    p 'Links'
    @page.css('a', 'href').each do |url|
      puts url.to_str
    end
    p '*********************************************************'
  end
end

@link = Link.new
@link.parse
