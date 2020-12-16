require './email'
require './sms'

Email.log
Email.new.send_message('message_email')
Sms.new.send_message('message_sms')