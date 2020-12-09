require 'faraday'

class Image
  def download(url)
    response = Faraday.get(url)
    File.open("", 'w') { |fp| fp.write(response.body) }
  end
end
Image.new("https://www.hello.com/img_/hello_logo_hero.png")
