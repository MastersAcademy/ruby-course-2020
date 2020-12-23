class Email
  include Notification
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  def valid?(email)
    email =~ VALID_EMAIL_REGEX
  end

  def deliver(recepient)
    if valid?(recepient)
      send_message(recepient)
    else
      add_to_log(recepient)
      raise StandardError, 'email is not valid'
    end
  end
end
