require '../homework_6/document'

class Link < Document
  def parse
    super
    @doc.css('a').each { |i| puts i[:href] }
  end
end

link = Link.new
link.parse
