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
    begin
      raise "wrong #{self.class.name.downcase} format"
    rescue => error
      add_to_log(error.message)
    end
    puts "Sending #{self.class.name} to #{recepient}"
    yield if block_given? 
  end
end
      
class Email
  include Notification
end

class Sms
  include Notification
end

Email.new.send_message("example@mail.com")
Sms.new.send_message("+380671234567")
