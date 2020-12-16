module Notification
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def log
      if name.eql? 'Sms'
        p File.read('Sms.log')
      else
        p File.read('Email.log')
      end
    end
  end

  def add_to_log(recepient)
    if instance_of?(Sms)
      File.open('Sms.log', 'w') { |txt| txt.write(recepient) }
    else
      File.open('Email.log', 'w') { |txt| txt.write(recepient) }
    end
  end

  def send_message(recepient)
    if instance_of?(Sms)
      raise ArgumentError, "#{recepient} wrong number" unless recepient.match(/^\+?3?8?(0[5-9][0-9]\d{7})$/)
      p "Sending SMS to #{recepient}"
    else
      raise ArgumentError, "#{recepient} wrong email format" unless recepient.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      p "Sending Email to #{recepient}"
    end
  rescue ArgumentError => e
    add_to_log(e)
  end
end

class Email
  include Notification
end

class Sms
  include Notification
end
