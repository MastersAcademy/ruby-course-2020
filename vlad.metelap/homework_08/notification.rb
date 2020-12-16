# frozen_string_literal: true

module Notification
  def self.included(base)
    base.extend(ClassMethods)
  end

  def send_message(recepient)
    yield if block_given?
    Service::Deliver.new.send(self.class.to_s.downcase, recepient)
  end

  def add_to_log(recepient)
    open("./#{self.class}.log", 'a') do |file|
      file.write("#{Time.now} - #{recepient} got an error\n")
    end
  end

  module ClassMethods
    def log
      open("./#{name}.log", 'r') { |f| puts f.read }
    end
  end
end
