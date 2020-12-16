require './notification'

class Email
  include Notification

  RECIPIENT_VALIDATION = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.freeze
end
