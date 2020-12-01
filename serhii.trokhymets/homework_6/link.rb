# frozen_string_literal: true

require './document'

class Link < Document
  def parse
    super
    puts(@doc.xpath('//a').map { |a| a[:href] }.find_all { |l| l.match(/(^http)/) })
  end
end

link = Link.new('/Users/sergejtrohimec/Documents/GitHub/ruby-course-2020/serhii.trokhymets/homework_6/File.html')
link.parse
