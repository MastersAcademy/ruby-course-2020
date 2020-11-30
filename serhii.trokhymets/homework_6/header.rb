# frozen_string_literal: true

require './document'

class Header < Document
  def parse
    super
    puts h_text = @doc.css('h1, h3').map { |h| h.text.strip }
  end
end

header = Header.new()
header.parse
