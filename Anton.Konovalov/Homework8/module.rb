# frozen_string_literal: true

require 'active_support/concern'

module Notification
  extend ActiveSupport::Concern
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/.freeze

  class_methods do
    def log
      if name.eql? 'Email'
        p File.read('email_log.txt')
      else
        p File.read('sms_log.txt')
      end
    end
  end

  def add_to_log(recepient)
    File.open("./#{self.class.name.downcase}.log", 'a') do |file|
      file.puts("#{recepient}: got an error \n ")
    end
  end

  def send_message(recepient)
    yield if block_given?
    if self.class.instance_of?(Email)
      raise StandardError, 'wrong number' unless recepient.match(VALID_EMAIL_REGEX)

      puts 'send email'
    else
      raise StandardError, 'wrong email format' unless recepient.match(VALID_PHONE_REGEX)

      puts 'send sms'
    end
  rescue StandardError => e
    add_to_log(e)
  end
end

class Email
  include Notification
end

class Sms
  include Notification
end

Sms.new.send_message('0671234567')
