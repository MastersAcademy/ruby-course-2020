module Notification
  
  module ClassMetods
    def log
      File.read("#{name.downcase}.log")
    end
  end

  def self.included(base)
    base.extend(ClassMetods)
  end

  def add_to_log(recepient)
    file = File.new("#{self.class.name.downcase}.log" , "a")
    file.puts recepient
    file.close
  end

  def send_message(recepient)
    puts "Sending #{self.class.name} to #{recepient}"
  end
end
      
class Email
    include Notification
end

class Sms
    include Notification
end

begin
  raise "wrong email format"
rescue => error
    Email.new.add_to_log(error.message)
end

begin
    raise "wrong sms format"
  rescue => error
      Sms.new.add_to_log(error.message)
  end

Email.new.send_message("example@mail.com")
Sms.new.send_message("+380671234567")
