require './notification'

class Sms
  include Notification

  def self.log
    puts IO.readlines('sms.log')
  end

  def add_to_log(recipient)
    File.write('sms.log', "#{recipient} got an error\n", mode: 'a')
  end

  def send_message(recipient)
    yield if block_given?
    add_to_log(recipient) and raise ArgumentError, 'wrong number' unless recipient =~ /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

    puts "Sending SMS to #{recipient}"
  end
end

Sms.new.send_message('+380671234567')
