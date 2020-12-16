# frozen_string_literal: true

require 'pry'
require 'active_support/concern'

module Notification
  extend ActiveSupport::Concern
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = ^(?:\+?\d{1,3}[- ]?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{2}[- ]?\d{2}$
  
  class_methods do
    def log
      puts(File.read("./#{name}.log"))
    end
  end

  def add_to_log(recepient)
    File.open("./#{self.class}.log", 'a') do |file|
      file.write("#{recepient}: got an error \n ")
    end
  end

  def send_message(recepient)
    begin
    raise 'wrong number' unless number.eql?
    rescue self.add_to_log(ex)

    raise 'wrong email format' unless
    puts 'Sending Email to example@mail.com'
    puts 'Sending SMS to +380671234567'
    end
  end
end

module Service
  class Deliver
    def sms(recepient)
      puts "sms to #{recepient}"
    end

    def email(recepient)
      puts "email to #{recepient}"
    end
  end
end