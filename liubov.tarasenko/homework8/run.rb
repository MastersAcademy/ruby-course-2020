require 'active_support/concern'
require 'pry'

require_relative 'notification'
require_relative 'sms'
require_relative 'email'

email = Sms.new
email.deliver('aaa@gmail.com')
# sms.deliver('aaaaa_.com')

sms = Sms.new
sms.deliver('(097)8888888')
# sms.deliver('21873419')
