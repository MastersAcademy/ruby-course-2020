# frozen_string_literal: true

require_relative 'notification'
require_relative 'sms'
require_relative 'email'
require_relative 'service'

email = Email.new
email.deliver('my_mail@ukr.net')
# email.deliver('my_mail_ukr.net')

sms = Sms.new
sms.deliver('(063)1111111')
# sms.deliver('77777777777777')
