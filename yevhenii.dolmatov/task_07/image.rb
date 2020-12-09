require 'faraday'

class Image
  def download(url)
    response = Faraday.get(url)
    original_extension = url.split(//).last(4).join
    response_first_number = response.status.to_s.split('')[0]

    raise TypeError, 'Wrong type' unless %w[jpeg .jpg .png].include?(original_extension)
    raise ArgumentError, 'Wrong URL' if %w[4 5].include?(response_first_number)

    File.open("./download#{original_extension}", 'wb') { |f| f.write(response.body) }
  end
end

hello = Image.new
bicycle = Image.new

hello.download('https://www.hello.com/img_/hello_logo_hero.png')
bicycle.download('http://apikabu.ru/img_n/2012-04_4/zky.jpg')
