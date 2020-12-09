require 'faraday'

class Image
  def self.download(url)
    response = Faraday.get url
    extension = response.headers['content-type'].split('/').last
    content_type = response.headers['content-type'].split('/').first
    raise TypeError, 'file is not an image' if content_type != 'image'
    raise ArgumentError, 'wrong url' if response.status.to_int.between?(400, 599)

    File.open("download.#{extension}", 'w') { |fp| fp.write(response.body) }
  end
end

Image.download('https://www.hello.com/img_/hello_logo_hero.png')
