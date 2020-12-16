require_relative 'sms.rb'
require_relative 'email.rb'


Email.new.send_message('kek@mail.ru')
Email.new.send_message('kekmail.ru')
Sms.new.send_message('+380675171488')
Sms.new.send_message('0675171488')
