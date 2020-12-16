# frozen_string_literal: true

require './notification.rb'

class Email
  include Notification

  def sender(recepient)
    email_regexp = /\A[^@\s]+@[^@\s]+\z/
    if recepient.match(email_regexp)
      send_message(recepient)
    else
      add_to_log(recepient)
    end
  end
end
send = Email.new
send.sender('bla-bla-bla@mail.com')
send_two = Email.new
send_two.sender('rnueve9vv7')
