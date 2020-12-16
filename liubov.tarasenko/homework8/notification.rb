module Notification
  def self.log
    puts ( File.read("./log"))
  end

  def add_to_log(recepient)
    File.open("./log", "a"){ | f |
      f.puts("#{recepient}: Error")
    }
  end

  def send_message(recepient)
    puts "Sending #{self.class.name} to #{recepient}" 
  end

end  