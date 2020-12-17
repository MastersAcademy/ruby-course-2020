require_relative 'notification'
require_relative 'service'

class Email
  include Notification

  RECIPIENT_VALIDATION = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.freeze
end
