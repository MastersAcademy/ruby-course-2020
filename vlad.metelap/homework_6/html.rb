require 'nokogiri'
class Html
  attr_accessor :document

  def initialize(path)
    @path = path
  end

  def parse_html
    html_file = File.read(@path)
    @document = Nokogiri::HTML(html_file)
  end
end

