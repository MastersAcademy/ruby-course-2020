require './notification'

class Sms
  include Notification

  def sender(recepient)
    phone_regexp = /^\+?3?8?(0[5-9][0-9]\d{7})$/
    if recepient.match(phone_regexp)
      send_message(recepient)
    else
      add_to_log(recepient)
    end
  end
end

sms = Sms.new
sms.sender('+380931234567')
sms.sender('7843434')
