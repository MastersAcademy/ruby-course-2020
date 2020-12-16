require_relative 'html'

class Head < Html
  def parse_html
    super
    p @document.css('h6, h5, h4, h3, h2, h1').map(&:to_xhtml)
  end
end

Head.new('./files/index.html').parse_html
