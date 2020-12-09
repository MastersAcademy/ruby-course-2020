# frozen_string_literal: true

require 'faraday'
require 'open-uri'
require 'uri'

class Image
  def download(url)
    result = Faraday.get (url)
    # raise ArgumentError, "code #{result.status}" if url =~URI::regexp
    # raise ArgumentError.new('not an image') if response is not an image
    # raise ArgumentError, 'Argument is not numeric' unless url =~URI::regexp
    raise ArgumentError, "code #{result.status}" if result.status != 200

    # url =~ URI::regexp
    File.open('image.png', 'wb') { |fp| fp.write(result.body) }
  end
end
image = Image.new
image.download('https://www.hello.com/img_/hello_logo_hero.png')
