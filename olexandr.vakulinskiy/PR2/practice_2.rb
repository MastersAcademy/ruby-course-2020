module Notification
  def self.included(base)
    base.extend(ClassMethod)
  end

  def add_to_log(recipient)
    File.open("#{self.class.name.downcase}.log", 'a') { |file| file.write "#{recipient}\n" }
  end

  def send_message(recipient)
    class_name = self.class.name
    puts "Sending #{class_name.downcase} to #{recipient}"
  end

  module ClassMethod
    def log
      File.read("#{name.downcase}.log").to_s
    end
  end
end

class Email
  include Notification

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/.freeze

  def email_validator
    raise StandardError, 'wrong email format' unless @recipient.match?(EMAIL_REGEX)
  rescue StandardError
    @recipient = "#{@recipient} got an error. Wrong email format"
  end

  def initialize(recipient)
    @recipient = recipient
  end

  def notify
    send_message(@recipient)
    email_validator
    add_to_log(@recipient)
  end
end

class Sms
  include Notification

  PHONE_NUMBER_REGEX = /\+[0-9]{12}\b/.freeze

  def number_validator
    raise StandardError, 'wrong number format' unless @recipient.match?(PHONE_NUMBER_REGEX)
  rescue StandardError
    @recipient = "#{@recipient} got an error. Wrong number format"
  end

  def initialize(recipient)
    @recipient = recipient
  end

  def notify
    send_message(@recipient)
    number_validator
    add_to_log(@recipient)
  end
end

my_email = Email.new('example@mail.com')
my_email2 = Email.new('examplemail.com')
my_email.notify
my_email2.notify
print <<~SMS_LOG
  --------Email log--------
  #{Email.log}
  -------------------------
SMS_LOG

my_sms = Sms.new('380671234567')
mys_sms2 = Sms.new('+380671234567')
my_sms.notify
mys_sms2.notify
print <<~SMS_LOG
  --------SMS log--------
  #{Sms.log}
  -----------------------
SMS_LOG
