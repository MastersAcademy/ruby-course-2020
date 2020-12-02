require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Document
  def initialize
    @page = Nokogiri::HTML(open('https://nokogiri.org/tutorials/installing_nokogiri.html'))
  end

  def parse; end
end
