require 'faraday'

class Image
  def download(url, file_name)
    response = Faraday.get url
    url_ext = file_extension(url)

    raise ArgumentError, "wrong url, status code #{response.status}" unless response.status == 200
    raise TypeError, 'file is not an image' unless image?(url_ext)

    File.open("#{file_name}#{url_ext}", 'wb') { |fp| fp.write(response.body) }
  end

  def file_extension(url)
    case
    when url.match?(/\.(?<=\.)[^.]+(?=\?)/)
      url[/\.(?<=\.)[^.]+(?=\?)/]
    when url.match?(/\.\w{3,4}($|\?)/)
      url[/\.\w{3,4}($|\?)/]
    else
      raise TypeError, 'file is not an image'
    end
  end

  def image?(url_ext)
    %w[.jpg .jpeg .png].include?(url_ext)
  end
end
Image.new.download('https://www.hello.com/img_/hello_logo_hero.png', 'first_image')
Image.new.download('https://apikabu.ru/img_n/2012-04_4/zky.jpg', 'second_image')
Image.new.download('https://miro.medium.com/max/4000/1*KUy_KKExZrSpBuv9XfyBgA.png?somasda=asd&location=Cherkassy',
                   'third_image')
