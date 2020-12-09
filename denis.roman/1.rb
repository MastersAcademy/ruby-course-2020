require 'faraday'

class Image

  def self.download(url)
    response = Faraday.get url
    extension = response.headers["content-type"].split('/').last
    File.open("download.#{extension}", 'w') { |fp| fp.write(response.body) }
    raise StandardError, 'file is not an image' if extension != 'png'
  end

end

Image.download('https://www.hello.com/img_/hello_logo_hero.png')