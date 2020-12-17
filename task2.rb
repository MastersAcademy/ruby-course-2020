# frozen_string_literal: true

module Notification
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def log
      puts File.read("#{name.downcase}.log")
    end
  end

  def send_message(recepient)
    puts "Sending #{self.class.name} to #{recepient}"
  end

  def add_to_log(recepient)
    File.open("./#{self.class.name.downcase}.log", 'a') do |c|
      c.puts("#{recepient}: got an error \n ")
    end
  end
end

class Sms
  include Notification
  VALID_NUMBER = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/.freeze

  def valid?(number)
    number =~ VALID_NUMBER
  end

  def send(recepient)
    if valid?(recepient)
      send_message(recepient)
    else
      add_to_log(recepient)
      raise StandardError, 'wrong number'
    end
  end
end

class Email
  include Notification
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  def valid?(email)
    email =~ VALID_EMAIL
  end

  def send(recepient)
    if valid?(recepient)
      send_message(recepient)
    else
      add_to_log(recepient)
      raise StandardError, 'wrong email format'
    end
  end
end
Email.new.send('roman@gmail.com')
Email.log
