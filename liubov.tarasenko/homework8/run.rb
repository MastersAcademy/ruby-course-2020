require 'active_support/concern'
require 'pry'

require_relative 'notification'
require_relative 'sms'
require_relative 'email'

sms = Sms.new

binding.pry
