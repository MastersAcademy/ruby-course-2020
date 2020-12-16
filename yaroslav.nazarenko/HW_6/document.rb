# Do general things
class Document
  def parse
    @doc = Nokogiri::HTML(open('index.html'))
  end
end
