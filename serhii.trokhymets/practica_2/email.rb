# frozen_string_literal: true

require './notification.rb'

class Email
  include Notification
end
send = Email.new
send.send_message('380932072099')
# send.send_message('0434')
send.send_message('fefef')
# send.send_message("SErhii@mail.com")
