# frozen_string_literal: true

require 'nokogiri'

# implementation of Document class
class Document
  def initialize(source)
    @source = source
  end

  def parse
    raise 'File not found.' unless File.exist?(@source)

    @document = Nokogiri::HTML(File.open(@source))
  end
end
