# Code should send notifications to cell phones and emails
# Implementation Steps
# Create module Notification
# Add class method log and instance methods add_to_log(recepient) and send_message(recepient)
# Class method log should show log file for this class
# Create two classes Email and Sms and use Notification module in them
# Raise exceptions: wrong email format, wrong number and write to appropriate log file with add_to_log method (email.log, sms.log)
# Module send_message should puts 'Sending Email to example@mail.com' or 'Sending SMS to +380671234567' and have run block code
# Hint to determine type you can use self.class in instance methods and self.name for class methods
# Note: you can debug using pry gem. Just write require pry; binding.pry in line where you want to have a breakpoint and run your code

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

  # '^.?\d{12}'
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
