class Email
  include Notification
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def valid? (email)
    email =~ VALID_EMAIL_REGEX
  end

  def deliver(recepient)
    if  valid?(recepient)
      send_message(recepient)  
    else
      raise StandardError, "email is not valid" 
    end
  end
end

