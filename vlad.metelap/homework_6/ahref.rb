require_relative 'html'

class Ahref < Html
  def parse_html
    super
    puts @document.css("a").map(&:to_xhtml)
  end
end

Ahref.new('./files/index.html').parse_html