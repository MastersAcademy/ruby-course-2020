require 'faraday'

class Image
  def initialize(url)
    @url = url
  end

  def download
    @response = Faraday.get @url
    response_status_success?
    response_image_type?
    new_file
  end

  private

  def response_status_success?
    raise ArgumentError "wrong url (status code: #{@response.status}" unless @response.success?
  end

  def response_image_type?
    raise TypeError "file is not an image (#{@response.headers['content-type']})" unless @response.headers['content-type'].include? 'image'
  end

  def new_file
    File.open("download.#{@response.headers['content-type'].split('/').last}", 'wb') { |fp| fp.write(@response.body) }
  end
end

Image.new('https://pustunchik.ua/uploads/radio/cache/83332d52c5446b6faaf7abcecfa97d51.png').download
