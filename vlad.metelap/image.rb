require 'faraday'
require "open-uri"

class Image
  def self.download(url)
    begin
      resp = Faraday.get(url) do |req|
        headers = req.headers['Content-Type']

        raise 'Bad content-type exception.' if !headers["content-type"].include? "image"
        File.open('image1.png', 'wb') { |fp| fp.write(req.body)}
      end
      raise 'Bad response exception.' if resp.status != 200
    rescue StandardError => e
      puts e.message
      puts e.backtrace.inspect
    end
    end
end
url = 'https://lostisland.github.io/faraday/assets/img/logo.png'
obj = Image.download(url)
