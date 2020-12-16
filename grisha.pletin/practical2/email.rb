require_relative 'notification_module'

class Email
  include Notification

  def valid?(recipient)
    recipient.match?(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
  end
end
