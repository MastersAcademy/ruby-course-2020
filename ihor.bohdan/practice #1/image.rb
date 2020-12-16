require 'faraday'
require 'pry'

class Image
  def download(url)
    response = Faraday.get(url)
    type, extension = response.headers['content-type'].split('/')

    raise ArgumentError, 'bad response' if response.status =~ /(4..|5..)/
    raise TypeError, 'wrong content type' unless type.eql? 'image'

    File.open("download.#{extension}", 'w') { |fp| fp.write(response.body) }
  end
end
