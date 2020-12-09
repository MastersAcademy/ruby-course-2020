# frozen_string_literal: true

require 'faraday'
require 'pry'

# class implements ability to download image from web
class Image
  def download(url)
    response = Faraday.get url

    raise ArgumentError, 'wrong url' if response.status != 200

    content_type = response.headers['content-type'].split('/')

    raise TypeError, 'Please use image url' unless content_type[0] == 'image'

    File.open("./test.#{content_type[1]}", 'wb') do |file|
      file.write(response.body)
    end
  end
end

some = Image.new
some.download('http://apikabu.ru/img_n/2012-04_4/zky.jpg')
