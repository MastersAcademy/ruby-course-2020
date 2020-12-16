module Notification
  def self.log
    case name
    when Email
      File.read('email.log').split
    when Sms
      File.read('sms.log').split
    end
  end

  def add_to_log(recipient)
    case self.class
    when Email
      File.open('email.log', 'wb') { |file| file.write recipient }
    when Sms
      File.open('sms.log', 'wb') { |file| file.write recipient }
    end
  end

  def send_message(recipient)
    case self.class
    when Email
      puts "Sending mail to #{recipient}"
    when Sms
      puts "Sending SMS to #{recipient}"
    end
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

  end
end

my_email = Email.new('example@mail.com')
my_email.notify


my_sms = Sms.new('+380671234567')
my_sms.notify

