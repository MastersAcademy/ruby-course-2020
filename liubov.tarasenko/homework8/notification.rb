module Notification
  def self.log
    puts ( File.read("./log"))
  end

  def add_to_log(recepient)
    File.open("./log", "a"){ | f |
      f.puts("#{recepient}: got an error \n ")
    }
  end

  def send_message(recepient)
    puts "Sending #{self.class.name} to #{recepient}" 
    yield if block_given?
  end

end  