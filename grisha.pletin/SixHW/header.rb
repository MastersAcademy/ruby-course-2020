
require './HTMLparse'

class Header < Document
  def parse
    p 'Headers'
    @page.css('h2').each do |el|
      puts el.to_str
    end
    p '*********************************************************'
  end
end


@header = Header.new
@header.parse
