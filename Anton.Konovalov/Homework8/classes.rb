# frozen_string_literal: true

class Email
  include Notification
  def deliver(recepient)
    raise StandardError, 'wrong email'
  end
end


class Sms
  include Notification
  def deliver(recepient)
    raise StandardError, 'wrong number'
  end
end


Email.new
Sms.new