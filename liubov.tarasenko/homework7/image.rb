# frozen_string_literal: true

require 'faraday'
class Image
  def download(url)
    @url = url
    ext = @url.split('.').last
    response = Faraday.get @url
    raise ArgumentError, "code #{response.status}" if response.status != 200
    raise TypeError, 'Not an image' unless typeCorrect?(response.headers['content-type'])

    img = response.body
    save(img, ext)
  end

  def save(img, ext)
    File.open("./download.#{ext}", 'wb') { |fp| fp.write(img) }
  end

  def typeCorrect?(type)
    type.include?('jpg') || type.include?('jpeg') || type.include?('png') || type.include?('image')
  end
end

i = Image.new.download('https://cdn.mos.cms.futurecdn.net/yL3oYd7H2FHDDXRXwjmbMf.jpg')
