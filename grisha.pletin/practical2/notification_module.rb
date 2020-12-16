module Notification

  def self.included(base)
    base.extend(ClassMethods)
  end

  def send_message(recipient)
    yield if block_given?
  end

  def add_to_log(recipient)
    open("#{self.class}.log", 'a') do |file|
      file.write("#{recipient} got an error\n")
    end
  end

  module ClassMethods
    def log
      open("#{name}.log", 'r') do |file|
        puts file.read
      end
    end
  end
end
