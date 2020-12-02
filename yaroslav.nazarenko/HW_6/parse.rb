require 'nokogiri'
require './document'
require './link'
require './header'

link = Link.new
header = Header.new

link.parse
header.parse
