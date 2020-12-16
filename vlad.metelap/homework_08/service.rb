# frozen_string_literal: true

module Service
  class Deliver
    def sms(recepient)
      puts "Delive sms to #{recepient}"
    end

    def email(recepient)
      p "Delive email to #{recepient}"
    end
  end
end
