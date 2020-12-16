module Notification
  def self.log
    File.read("#{name.downcase}.log").split
  end

  def add_to_log(recipient)
    class_name = self.class.name
    File.open("#{class_name}.log", 'wb') { |file| file.write recipient }
  end

  def send_message(recipient)
    class_name = self.class.name
    puts "Sending #{class_name.downcase} to #{recipient}"
  end
end

class Email
  include Notification

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/.freeze

  def initialize(recipient)
    @recipient = recipient
  end

  def notify
    raise ArgumentError, 'wrong email format' unless @recipient.match?(EMAIL_REGEX)

    send_message(@recipient)
    add_to_log(@recipient)
  end
end

class Sms
  include Notification

  PHONE_NUMBER_REGEX = /\+[0-9]{12}\b/.freeze

  def initialize(recipient)
    @recipient = recipient
  end

  def notify
    raise ArgumentError, 'wrong number format' unless @recipient.match?(PHONE_NUMBER_REGEX)

    send_message(@recipient)
    add_to_log(@recipient)
  end
end

my_email = Email.new('example@mail.com')
my_email.notify

my_sms = Sms.new('+380671234567')
my_sms.notify
