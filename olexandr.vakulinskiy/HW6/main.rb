require_relative 'document'
require_relative 'header'
require_relative 'link'

puts 'Headers from HTML:'
puts '-' * 60
doc_headers = Header.new
doc_headers.parse_html
puts '-' * 60

puts 'Links from HTML:'
puts '-' * 60
doc_links = Link.new
doc_links.parse_html
puts '-' * 60
