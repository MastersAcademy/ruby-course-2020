module Notification

  def self.included(base)
    base.extend(ClassMethods)
  end

  def add_to_log(recipient)
    File.write("./#{self.class.name.downcase}.log", "#{recipient} got an error\n", mode: 'a')
  end

  def abort(recipient)
    add_to_log(recipient)
    raise ArgumentError, "wrong #{self.class.name.downcase}"
  end

  def send_message(recipient)
    yield if block_given?
    abort(recipient) unless recipient =~ self.class.const_get('RECIPIENT_VALIDATION')

    puts "Sending #{self.class.name.downcase} to #{recipient}"
    service = Service::Deliver.new
    method_name = self.class.name.downcase
    service.send(method_name, recipient)
  end
end

module ClassMethods
  def log
    raise "file '#{name.downcase}.log' does not exist" unless File.exist?("./#{name.downcase}.log")

    puts IO.readlines("./#{name.downcase}.log")
  end
end
