require_relative 'notification_module.rb'

class Email
  include Notification

  def send_message(email)
    p email
    mail = email =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    raise StandartError, 'E-mail you`ve input is not correct' if mail != 0
  rescue StandardError => error
    p 'An error has occured, check log'
    add_to_log(email)
  else
    nil
  end
end
