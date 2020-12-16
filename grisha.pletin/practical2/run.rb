require_relative 'sms'
require_relative 'email'

Email.new.send_message('kek@mail.ru')
Email.new.send_message('kekmail.ru')
Email.new.send_message('+380675171488')
Sms.new.send_message('kek@mail.ru')
Sms.new.send_message('0675171488')
