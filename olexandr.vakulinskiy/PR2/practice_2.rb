module Notification
  def self.included(base)
    base.extend(ClassMethod)
  end

  def add_to_log(recipient, validator)
    validator
  rescue StandardError
    recipient = "#{recipient} got an error\n"
  ensure
    File.open("#{self.class.name.downcase}.log", 'wb') { |file| file.write "#{recipient}\n" }
  end

  def send_message(recipient)
    class_name = self.class.name
    puts "Sending #{class_name.downcase} to #{recipient}"
  end

  module ClassMethod
    def log
      File.read("#{name.downcase}.log").split
    end
  end
end

class Email
  include Notification

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/.freeze

  def email_validator
    raise StandardError, 'wrong email format' unless @recipient.match?(EMAIL_REGEX)
  end

  def initialize(recipient)
    @recipient = recipient
  end

  def notify
    send_message(@recipient)
    add_to_log(@recipient, email_validator)
  end
end

class Sms
  include Notification

  PHONE_NUMBER_REGEX = /\+[0-9]{12}\b/.freeze

  def number_validator
    raise StandardError, 'wrong number format' unless @recipient.match?(PHONE_NUMBER_REGEX)
  end

  def initialize(recipient)
    @recipient = recipient
  end

  def notify
    send_message(@recipient)
    add_to_log(@recipient, number_validator)
  end
end

my_email = Email.new('example@mail.com')
my_email.notify
puts <<-EMAIL_LOG
  ------Email log------
  #{Email.log}
  ---------------------
EMAIL_LOG

my_sms = Sms.new('+380671234567')
my_sms.notify
print <<-SMS_LOG
  ------Email log------
  #{Sms.log}
  ---------------------
SMS_LOG
