require '../homework_6/document'

class Header < Document
  def parse
    super
    @doc.css('h2').each { |i| puts i.text }
  end
end

header = Header.new
header.parse
