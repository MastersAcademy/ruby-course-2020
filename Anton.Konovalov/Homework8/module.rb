# frozen_string_literal: true

require 'pry'
require 'active_support/concern'

module Notification
  extend ActiveSupport::Concern
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  class_methods do
    def log
      if name.eql? 'Email'
        p File.read('email_log.txt')
      else
        p File.read('sms_log.txt')
    end
  end

  def add_to_log(recepient)
    File.open("./#{self.class}.log", 'a') do |file|
      file.write("#{recepient}: got an error \n ")
    end
  end

  def send_message(recepient)
    if self.class.eql? Email
    raise StandartError, 'wrong number' unless recepient.match(VALID_EMAIL_REGEX)
    puts 'send email'
  else
    raise StandartError, 'wrong email format' unless recepient.match(VALID_PHONE_REGEX)
    puts 'send sms'
  end

  rescue StandartError => e
    add_to_log(e)
  end
end


class Email
  include Notification
end


class Sms
  include Notification
end
end