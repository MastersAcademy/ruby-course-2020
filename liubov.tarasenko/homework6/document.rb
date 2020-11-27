require 'nokogiri'
class Document
  attr_accessor :doc

  def initialize(file_path)
    @file_path = file_path
  end

  def parse
    content = File.read(@file_path)
    @doc = Nokogiri::HTML(content)
  end
end
