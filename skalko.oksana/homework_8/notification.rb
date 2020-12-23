module Notification
  VALID_NUMBER = /^\+?3?8?(0[5-9][0-9]\d{7})$/.freeze
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def log
      p File.read("#{name}.log")
    end
  end

  def add_to_log(recepient)
    File.open("#{self.class}.log", 'w') { |txt| txt.write(recepient) }
  end

  def send_message(recepient)
    yield if block_given?
    if instance_of?(Sms)
      raise ArgumentError, "#{recepient} wrong number" unless recepient.match(VALID_NUMBER)

      p "Sending SMS to #{recepient}"
    else
      raise ArgumentError, "#{recepient} wrong email format" unless recepient.match(VALID_EMAIL)

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
