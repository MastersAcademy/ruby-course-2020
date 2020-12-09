require_relative 'document'
require_relative 'header'
require_relative 'link'

doc_headers = Header.new
doc_headers.parse_html
doc_links = Link.new
doc_links.parse_html
