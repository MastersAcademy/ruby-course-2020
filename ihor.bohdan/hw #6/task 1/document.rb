require 'nokogiri'
require 'open-uri'

class Document
  def initialize(url)
    @url = url
  end

  def parse
    @parse ||= Nokogiri::HTML(URI.parse(@url).open)
  end
end
