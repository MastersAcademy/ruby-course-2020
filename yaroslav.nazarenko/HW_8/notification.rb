# frozen_string_literal: true

module Notification
  def self.included(entity)
    entity.extend(ClassMethods)
  end

  def add_to_log(recepient)
    File.open("./#{self.class}.log", 'a') do |file|
      file.write("wrong recepient #{recepient}\n")
    end
    p 'add to log'
  end

  def send_message(recepient)
    raise ArgumentError, 'wrong recepient' unless valid?(recepient)
    notify(recepient)
    yield if block_given?
  rescue ArgumentError => e
    add_to_log(recepient)
  end

  # log
  module ClassMethods
    def log
      puts "./#{self}.log"
      puts File.read("./#{self}.log")
    end
  end
end
