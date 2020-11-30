require 'nokogiri'

class Document
  attr_accessor :doc

  def initialize
    @file = 'File.html'
  end

  def parse
    content = File.read(@file)
    @doc = Nokogiri::HTML(content)
  end
end

