require 'faraday'
require 'open-uri'

class Image
  def initialize; end

  def download(url)
    begin
      response = Faraday.get(url)
      raise 'Wrong url' if response.status.to_s.split('')[0] == '4' || response.status.to_s.split('')[0] == '5'
    rescue ArgumentError
      puts 'Wrong numbers of arguments'
    rescue TypeError
      puts 'Wrong Type'
    end
    original_ext = url.split(//).last(4).join

    open(url) do |img|
      File.open("./download#{original_ext}", 'wb') do |f|
        f.write(img.read)
      end
    end
  end
end

img1 = Image.new
img2 = Image.new

img1.download('https://www.hello.com/img_/hello_logo_hero.png')
img2.download('http://apikabu.ru/img_n/2012-04_4/zky.jpg')
