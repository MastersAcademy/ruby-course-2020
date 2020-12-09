# frozen_string_literal: true

require 'pry'
require 'faraday'

class Image
  def download(url)
    @url = url
    ext = @url.split('.').last
    response = Faraday.get @url
    raise ArgumentError, "code #{response.status}" if response.status != 200
    raise TypeError, 'Not an image' unless type_correct?(response.headers['content-type'])

    img = response.body
    save(img, ext)
  end

  def save(img, ext)
    File.open("./download.#{ext}", 'wb') { |fp| fp.write(img) }
  end

  def type_correct?(type)
    type.include?('jpg') || type.include?('jpeg') || type.include?('png') || type.include?('image')
  end
end

Image.new.download('https://cdn.mos.cms.futurecdn.net/yL3oYd7H2FHDDXRXwjmbMf.jpg')
# binding.pry
# Image.new.download('https://google.com') --> ArgumentError: code 301
# Image.new.download('https://github.com/lubo4kaTarasenko/RubyHW') --> TypeError: Not an image
