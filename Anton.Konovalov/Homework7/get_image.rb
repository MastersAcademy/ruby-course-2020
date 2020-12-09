# frozen_string_literal: true

require 'faraday'
require 'pry'

class Image
  def download(url)
    response = Faraday.get(url)
    format = response.headers['content-type']

    raise ArgumentError, 'wrong response' unless response.success?
    raise TypeError, 'wrong format' unless format.include?('image')

    exp = response.headers['content-type'].split('/')

    File.open("./download.#{exp}", 'w') { |file| file.write(response.body) }
  end
end

Image.new.download('https://cdn.shopify.com/s/files/1/0495/3056/8867/products/Toster-Princess-Classic-Long-Slot-Toaster_Princess_images_big_27_8712836823723_93409d08-dee0-4615-bb18-7869a230aa13.jpg?v=1604416148')
