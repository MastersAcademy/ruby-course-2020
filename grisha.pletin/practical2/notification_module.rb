module Notification
  def self.included(base)
    base.extend(ClassMethods)
  end

  def send_message(recipient)
    puts "Sending #{self.class.name} to #{recipient}"
    check_recipient(recipient)
    yield if block_given?
  rescue StandardError
    puts 'An error has occurred, check log'
    add_to_log(recipient)
  else
    nil
  end

  def add_to_log(recipient)
    File.open("#{self.class}.log", 'a') do |file|
      file.write("#{recipient} got an error\n")
    end
  end

  def check_recipient(recipient)
    raise StandartError, 'Recipient is not correct' unless valid?(recipient)
  end

  def valid?;  end

  module ClassMethods
    def log
      File.open("#{name}.log", 'r') do |file|
        puts file.read
      end
    end
  end
end
