# frozen_string_literal: true

require './notification'

class Sms
  include Notification

  def valid?(recepient)
    recepient.match?(/\+\d{12}/)
  end

  def notify(recepient)
    "sending sms to #{recepient}"
  end
end
