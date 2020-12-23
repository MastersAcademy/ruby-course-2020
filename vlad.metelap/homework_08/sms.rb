# frozen_string_literal: true

class Sms
  include Notification
  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/.freeze

  def a_valid?(phone_number)
    phone_number =~ VALID_PHONE_NUMBER_REGEX
  end

  def deliver(recepient)
    if a_valid?(recepient)
      send_message(recepient)
    else
      add_to_log(recepient)
      raise ArgumentError, "Bad phone number format #{recepient}"
    end
  end
end
