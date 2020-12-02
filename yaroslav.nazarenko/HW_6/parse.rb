require 'nokogiri'
require './document.rb'
require './link.rb'
require './header.rb'

link = Link.new
header = Header.new

link.parse
header.parse
