require './notification'

class Sms
  include Notification

  RECIPIENT_VALIDATION = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/.freeze
end
