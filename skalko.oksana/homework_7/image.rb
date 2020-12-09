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
    raise ArgumentError "wrong url (status code: #{@response.status}" unless  @response.success?
  end

  def response_image_type?
    raise TypeError "file is not an image (#{@response.headers['content-type']})" unless @response.headers['content-type'].include? 'image'
  end

  def new_file
    File.open("download.#{@url.split('.')[-1]}", 'wb') { |fp| fp.write(@response.body) }
  end
end

Image.new('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToAd2vcSvKmjBu2KItmgGOKfcdAtN5aHt8yw&usqp=CAU').download
