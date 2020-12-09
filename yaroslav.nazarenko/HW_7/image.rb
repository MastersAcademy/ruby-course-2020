require "open-uri"

class Image
  def download(url)
    extension = File.extname(URI.parse(url).path)

    if ['.png', '.jpeg', 'jpg', '.gif'].include?(extension)
      open(url) do |image|
        File.open("./test#{extension}", "wb") do |file|
          file.write(image.read)
        end
      end
      p 'Image saved'
    else
      p 'wrong data or image format'
    end
  end
end

some = Image.new
some.download('https://www.hello.com/img_/hello_logo_hero.png')
