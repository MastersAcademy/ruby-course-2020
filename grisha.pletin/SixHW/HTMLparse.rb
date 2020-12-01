require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Document
  def initialize
    @page = Nokogiri::HTML(open('https://nokogiri.org/tutorials/installing_nokogiri.html'))
  end

  def parse; end
end

class Link < Document
  def parse
    p 'Links'
    @page.css('a', 'href').each do |url|
      puts url.to_str
    end
    p '*********************************************************'
  end
end

class Header < Document
  def parse
    p 'Headers'
    @page.css('h2').each do |el|
      puts el.to_str
    end
    p '*********************************************************'
  end
end

@link = Link.new
@link.parse
@header = Header.new
@header.parse
