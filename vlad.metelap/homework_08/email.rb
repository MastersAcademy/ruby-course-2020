class Email
  extend Notification
  def send(recepient)
    unless is_a_valid_email?(recepient)
      log(recepient, "#{Time.now} - #{recepient} got an error\n")
      raise ArgumentError, "Bad email format #{recepient}"
    end
  rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect
  end
  def is_a_valid_email?(email)
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end
end