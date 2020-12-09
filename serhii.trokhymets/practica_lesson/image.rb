# frozen_string_literal: true

require 'faraday'
require 'open-uri'
require 'uri'

class Image
  def download(url)
    result = Faraday.get(url)
    raise ArgumentError, "code #{result.status}" if result.status != 200
    raise TypeError, 'This not image' unless result.headers['content-type'].include? 'image'

    exp = result.headers['content-type'].split('/').last

    File.open("image.#{exp}", 'wb') { |fp| fp.write(result.body) }
  end
end
image = Image.new
image.download('https://www.hello.com/img_/hello_logo_hero.png')
