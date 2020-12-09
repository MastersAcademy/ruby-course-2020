require 'faraday'

class Image
  def download(url)
    response = Faraday.get(url)
    original_extension = response.headers['content-type'].split('/')
    response_first_number = response.status.to_s.split('')[0]

    raise TypeError, 'Wrong type' if original_extension[0] != 'image'
    raise ArgumentError, 'Wrong URL' if %w[4 5].include?(response_first_number)

    File.open("./download.#{original_extension[1]}", 'wb') { |f| f.write(response.body) }
  end
end

hello = Image.new
bicycle = Image.new
img = Image.new

hello.download('https://www.hello.com/img_/hello_logo_hero.png')
bicycle.download('http://apikabu.ru/img_n/2012-04_4/zky.jpg')
img.download('https://miro.medium.com/max/4000/1*KUy_KKExZrSpBuv9XfyBgA.png?somasda=asd&location=Cherkassy')
