# frozen_string_literal: true

require 'logger'
module Notification
  def add_to_log(recepient)
    puts "No valid #{recepient}"
    log_email = Logger.new('email_log.txt')
    log_sms = Logger.new('sms_log.txt')
  end

  def send_message(recepient)
    email_regexp = /\A[^@\s]+@[^@\s]+\z/
    phone_regexp = /^\+?3?8?(0[5-9][0-9]\d{7})$/
    if recepient.match(email_regexp) || recepient.match(phone_regexp)
      puts "SMS to #{recepient}"
    else
      add_to_log(recepient)
    end
  end
end
