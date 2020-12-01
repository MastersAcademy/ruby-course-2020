require 'nokogiri'

class Document
  attr_accessor :doc

  def initialize
    @songs = 'Songs.html'
  end

  def parse
    @doc = Nokogiri::XML(File.read(@songs))
  end
end
