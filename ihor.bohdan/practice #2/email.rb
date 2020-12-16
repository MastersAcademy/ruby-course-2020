require './notification'

class Email
  include Notification

  def self.log
    puts IO.readlines('email.log')
  end

  def add_to_log(recipient)
    File.write('email.log', "#{recipient} got an error\n", mode: 'a')
  end

  def send_message(recipient)
    add_to_log(recipient) and raise ArgumentError, 'wrong e-mail' unless recipient =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    puts "Sending Email to #{recipient}"
  end
end

Email.new.send_message('user@example.com')
