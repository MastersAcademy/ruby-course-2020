module Notification
  def self.log
    file = File.new("./log.txt", 'r')
    puts log = file.readlines
    log.close
  end

  def add_to_log(recepient)
    file = File.open("#{self.class.name}.txt", 'a')
    file.print("#{recepient} got an error\n")
  end

  def send_message(recepient)
    puts "Sending Email to #{recepient}"
    raise 'Wrong email', ArgumentError unless recepient.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/)
  end
end

class Email
  include Notification
end

class Sms
  include Notification

end

Sms.new.add_to_log('example@mail.com')
sms = Sms.log

