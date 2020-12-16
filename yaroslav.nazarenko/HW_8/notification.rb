module Notification
  def self.included(entity)
    entity.extend(ClassMethods)
  end

  def add_to_log(recepient)
    p 'add to log'
  end

  def send_message(recepient)
    p 'send a message'
  end

  module ClassMethods
    def log
      p 'log'
    end
  end
end