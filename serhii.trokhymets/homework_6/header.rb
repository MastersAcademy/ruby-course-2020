# frozen_string_literal: true

require './document'

class Header < Document
  def parse
    super
    puts @doc.css('h1, h2, h3, h4, h5, h6').map { |h| h.text.strip }
  end
end

header = Header.new('/Users/sergejtrohimec/Documents/GitHub/ruby-course-2020/serhii.trokhymets/homework_6/File.html')
header.parse
