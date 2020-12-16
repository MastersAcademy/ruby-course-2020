module Notification
  def log(recepient, text)
    output_file = File.open("./log.txt", "w") { |f| f.write "#{Time.now} - #{recepient} got an error\n" }
  end

  def add_to_log(recepient)
    recepient = nil
  end

  def send_message(recepient)
    recepient = nil
  end

end