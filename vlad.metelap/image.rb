require 'faraday'
require "open-uri"

class Image
  def self.download(url)
    begin
      response = Faraday.get(url)
      raise 'Bad response exception.' if response.status != 200
      string_headers = response.headers["content-type"]
      raise 'Bad content-type exception.' if !string_headers.include? "image"
      file_ext = string_headers.split('/')[1]
      # p file_ext
      File.open("image4.#{file_ext}", 'wb') { |fp| fp.write(response.body)}
    rescue StandardError => e
      puts e.message
      puts e.backtrace.inspect
    end
  end
end
url = 'https://lostisland.github.io/faraday/assets/img/logo.png'
obj = Image.download(url)
