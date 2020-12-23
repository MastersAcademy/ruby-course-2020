module Notification

  def self.log
    puts(File.read("./#{name}.log"))
  end

  def add_to_log(recipient)
    file = File.open("#{self.class.name}.log", 'a')
    file.print("#{recipient} got an error\n")
  end

  def send_message(recipient)
    puts "Sending #{self.class.name} to #{recipient}"
  end
end

class Email
  include Notification

  def send_mail(recipient)
    email = '\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z'
    if recipient.match(email)
      send_message(recipient)
    else
      add_to_log(recipient)
      raise ArgumentError, 'Wrong e-mail format.'
    end
  end
end

class Sms
  include Notification

  def send_sms(recipient)
    phone_number_regexp = '((\+38)?\(?\d{3}\)?[\s\.-]?(\d{7}|\d{3}[\s\.-]\d{2}[\s\.-]\d{2}|\d{3}-\d{4}))'
    if recipient.match(phone_number_regexp)
      send_message(recipient)
    else
      add_to_log(recipient)
      raise ArgumentError, 'Wrong phone number.'
    end
  end
end

Sms.new.send_sms('+38 067 123-45-67')
Email.new.send_mail('examasas21345p_le@mail.com')
