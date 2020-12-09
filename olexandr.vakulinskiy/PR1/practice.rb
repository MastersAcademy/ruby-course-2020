require 'faraday'

class Image
  def download(url, file_name)
    response = Faraday.get url

    raise ArgumentError, "wrong url, status code #{response.status}" unless response.status == 200
    raise TypeError, 'file is not an image' unless image?(url[/\.\w{3,4}($|\?)/])

    File.open("#{file_name}#{url[/\.\w{3,4}($|\?)/]}", 'wb') { |fp| fp.write(response.body) }
  end

  def image?(url_ext)
    url_ext.eql?('.png') || url_ext.eql?('.jpg') || url_ext.eql?('.image') || url_ext.eql?('.jpeg')
  end
end
Image.new.download('https://www.hello.com/img_/hello_logo_hero.png', 'first_image')
Image.new.download('https://apikabu.ru/img_n/2012-04_4/zky.jpg', 'second_image')
