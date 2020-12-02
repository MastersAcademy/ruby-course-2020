# Puts links
class Link < Document
  def parse
    super
    puts 'Here is all <a> elements from your file'
    puts @doc.css('a')
    puts '<-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=->'
  end
end
