require 'nokogiri'
require './document'
require './link.rb'
require './header'

link = Link.new
header = Header.new

link.parse
header.parse
