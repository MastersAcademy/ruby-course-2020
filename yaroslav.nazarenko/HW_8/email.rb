# frozen_string_literal: true

require './notification'

class Email
  include Notification

  def valid?(recepient)
    recepient.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  def notify(recepient)
    "sending email to #{recepient}"
  end
end
