require_relative 'notification_module'

class Sms
  include Notification

  def valid?(recipient)
    recipient.match?(/^\+\d{12}/)
  end
end
