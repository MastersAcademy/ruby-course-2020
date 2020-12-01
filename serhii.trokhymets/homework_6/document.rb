# frozen_string_literal: true

require 'nokogiri'

class Document
  attr_accessor :doc

  def initialize(path)
    @path = path
  end

  def parse
    content = File.read(@path)
    @doc = Nokogiri::HTML(content)
  end
end
