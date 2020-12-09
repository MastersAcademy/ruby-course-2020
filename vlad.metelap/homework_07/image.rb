# frozen_string_literal: true

require 'faraday'
require 'pry'

class Image
  def self.download(url)
    response = Faraday.get(url)
    raise ArgumentError, "Bad response exception #{response.status}" unless response.status == 200

    string_headers = response.headers['content-type']
    raise TypeError, 'Bad content-type exception' unless string_headers.include? 'image'

    file_ext = string_headers.split('/').last
    File.open("image.#{file_ext}", 'wb') { |fp| fp.write(response.body) }
  rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect
  end
end

url = 'https://lostisland.github.io/faraday/assets/img/logo.png'
Image.download(url)
# binding.pry
