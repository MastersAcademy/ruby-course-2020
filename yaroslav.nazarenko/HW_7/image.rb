require 'faraday'
require 'pry'

class Image
  def download(url)
    response = Faraday.get url

    return p 'wrong url' if response.status != 200

    content_type = response.headers['content-type'].split('/')

    if content_type[0] == 'image'

      File.open("./test.#{content_type[1]}", "wb") do |file|
        file.write(response.body)
      end

    else
      p 'Please use image url'
    end
  end
end

some = Image.new
some.download('http://apikabu.ru/img_n/2012-04_4/zky.jpg')
