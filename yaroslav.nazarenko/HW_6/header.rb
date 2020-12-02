# Puts headers
class Header < Document
  def parse
    super
    puts 'Here is all <h2> elements from your file'
    puts @doc.css('h2')
    puts '<-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=->'
  end
end
