

module Notification
  def self.log
  end

  def add_to_log(recepient)
  end

  def send_message(recepient)
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
rescue 
    add_to_log
end