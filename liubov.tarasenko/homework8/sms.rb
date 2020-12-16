class Sms
  include Notification

  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/.freeze

  def valid?(number)
    number =~ VALID_PHONE_NUMBER_REGEX
  end

  def deliver(recepient)
    if valid?(recepient)
      send_message(recepient)
    else
      add_to_log(recepient)
      raise StandardError, 'is not phone number'
    end
  end
end
