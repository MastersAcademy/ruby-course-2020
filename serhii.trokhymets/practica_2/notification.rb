# frozen_string_literal: true

module Notification
  def add_to_log(recepient)
    File.open("./#{self.class.name}.txt", 'a') do |file|
      file << "#{recepient} not send #{self.class.name}\n "
    end
  end

  def send_message(recepient)
    puts "Send #{self.class.name} to #{recepient}"
  end
end
