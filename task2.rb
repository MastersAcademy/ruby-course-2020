# frozen_string_literal: true

module Notification
  VALID_NUMBER = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/.freeze
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def log
      puts File.read("#{name}.log")
    end
  end

  def valid?(data)
    if instance_of?(Email)
      data =~ VALID_EMAIL

    elsif instance_of?(Sms)
      data =~ VALID_NUMBER
    end
  end

  def send_message(recepient)
    if valid?(recepient)
      puts "Sending #{self.class.name} to #{recepient}"
      yield if block_given?
    else
      add_to_log(recepient)
      raise StandardError, "wrong #{self.class.name.downcase} format"
    end
  end

  def add_to_log(recepient)
    File.open("./#{self.class.name}.log", 'a') do |c|
      c.puts("#{recepient}: got an error \n ")
    end
  end
end

class Sms
  include Notification
end

class Email
  include Notification
end
Email.new.send_message('roman.denis@ukr.net')
