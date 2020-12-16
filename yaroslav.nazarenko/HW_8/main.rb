# frozen_string_literal: true

require './email'
require './sms'

Email.new.send_message('test@mail.com')
Email.new.send_message('testmail.com')
Sms.new.send_message('+380987654321')
Sms.new.send_message('/380987654321')
Email.log
