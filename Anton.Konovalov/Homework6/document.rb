# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class Document
  def parse
    @doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))
  end
end

class Header < Document
  def parse
    super
    @doc.css('h2').map(&:text).join(' ')
  end
end

class Link < Document
  def parse
    super
    nodeset = @doc.css('a[href]')
    nodeset.map { |element| element['href'] }.select { |links| links =~ /(^http)/ }
  end
end
