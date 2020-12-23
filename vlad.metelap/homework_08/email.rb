# frozen_string_literal: true

class Email
  include Notification
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  def a_valid?(email)
    email =~ VALID_EMAIL_REGEX
  end

  def deliver(recepient)
    if a_valid?(recepient)
      send_message(recepient)
    else
      add_to_log(recepient)
      raise ArgumentError, "Bad email format #{recepient}"
    end
  end
end
