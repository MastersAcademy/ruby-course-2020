module Notification
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def log
      if self.name.eql? 'Sms'
        File.open("Sms.log", 'r') { |txt| txt.read }
      else
        File.open("Email.log", 'r') { |txt| txt.read }
      end
      end
  end

  def add_to_log(recepient)
    if self.class.eql? Sms
      File.open("Sms.log", 'w') { |txt| txt.write(recepient) }
    else
      File.open("Email.log", 'w') { |txt| txt.write(recepient) }
    end
  end

  def send_message(recepient)
    if self.class.eql? Sms
      raise ArgumentError, "#{recepient} wrong number" unless
    else
      raise ArgumentError, "#{recepient} wrong email format"
    end
  rescue ArgumentError => error
    add_to_log(error)
  end
end

class Email
  include Notification
end

class Sms
  include Notification
end
